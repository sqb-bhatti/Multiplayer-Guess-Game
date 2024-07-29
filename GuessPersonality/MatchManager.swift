//
//  MatchManager.swift
//  GuessPersonality
//


import Foundation
import GameKit
import PencilKit


class MatchManager: NSObject, ObservableObject {
    @Published var inGame = false
    @Published var isGameOver = false
    @Published var isTimeKeeper = false
    @Published var authenticationState = playerAuthState.authenticating
    
    @Published var currentlyDrawing = false
    @Published var drawPrompt = ""
    @Published var pastGuesses = [PastGuess]()
    
    @Published var score = 0
    @Published var remainingTime = maxTimeRemaining
    @Published var lastReceivedDrawing = PKDrawing()
    
    
    var match: GKMatch?
    var otherPlayer: GKPlayer?
    var localPlayer = GKLocalPlayer.local
    
    var playerUUIDKey = UUID().uuidString
    
    var rootViewController: UIViewController? {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return windowScene?.windows.first?.rootViewController
    }
    
    func authenticateUser() {
        GKLocalPlayer.local.authenticateHandler = { [self] vc, error in
            if let viewController = vc {
                rootViewController?.present(viewController, animated: true)
                return
            }
            
            if let err = error {
                authenticationState = .error
                print(err.localizedDescription)
                
                return
            }
            
            if localPlayer.isAuthenticated {
                if localPlayer.isMultiplayerGamingRestricted {
                    authenticationState = .restricted
                } else {
                    authenticationState = .authenticated
                }
            } else {
                authenticationState = .unauthenticated
            }
        }
    }
    
    func startMatchmaking() {
        let request = GKMatchRequest()
        request.minPlayers = 2
        request.maxPlayers = 2
        
        let matchMakingVC = GKMatchmakerViewController(matchRequest: request)
        matchMakingVC?.matchmakerDelegate = self
        
        rootViewController?.present(matchMakingVC!, animated: true)
    }
    
    
    func startGame(newMatch: GKMatch) {
        match = newMatch
        match?.delegate = self
        
        otherPlayer = match?.players.first
        drawPrompt = words.randomElement()!
        
        sendString("Began: \(playerUUIDKey)")
    }
    
    
    func receivedString(message: String) {
        let messageSplit = message.split(separator: ":")
        guard let messagePrefix = messageSplit.first else {
            return
        }
        
        let parameter = String(messageSplit.last ?? "")
        
        switch messagePrefix {
        case "Began":
            if playerUUIDKey == parameter {
                playerUUIDKey = UUID().uuidString
                sendString("Began: \(playerUUIDKey)")
                break
            }
            
            currentlyDrawing = playerUUIDKey < parameter
            inGame = true
            isTimeKeeper = true
            
            if isTimeKeeper {
                let countDownTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            }
        default:
            break
        }
    }
        
}
