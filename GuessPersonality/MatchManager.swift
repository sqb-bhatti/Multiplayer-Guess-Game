//
//  MatchManager.swift
//  GuessPersonality
//


import Foundation



class MatchManager: ObservableObject {
    @Published var inGame = false
    @Published var isGameOver = false
    @Published var authenticationState = playerAuthState.authenticating
    
    @Published var currentlyDrawing = false
    @Published var drawPrompt = ""
    @Published var pastGuesses = [PastGuess]()
    
    @Published var score = 0
    @Published var remainingTime = maxTimeRemaining
}
