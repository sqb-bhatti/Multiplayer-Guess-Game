//
//  MenuView.swift
//  GuessPersonality
//


import SwiftUI

struct MenuView: View {
    @ObservedObject var matchManager: MatchManager
    
    var body: some View {
        ZStack {
            Color(red: 35/255, green: 200/255, blue: 237/255)
                .ignoresSafeArea()
            
            VStack {
                Image("guess")
                .resizable()
                .scaledToFit()
                .padding(20)
                
                Button {
                    // To Dod
                } label: {
                    Text("Play")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                }
                .disabled(matchManager.authenticationState != .authenticated || matchManager.inGame)
                .padding(.vertical, 20)
                .padding(.horizontal, 100)
                .background(
                    Capsule(style: .circular)
                        .fill(matchManager.authenticationState != .authenticated || matchManager.inGame ? .gray: Color(red: 89/255, green: 185/255, blue: 139/255)))
                
                Text(matchManager.authenticationState.rawValue)
                    .font(.headline.weight(.semibold))
                    .foregroundStyle(.white)
                    .padding()
            }
        }
    } 
}

#Preview {
    MenuView(matchManager: MatchManager())
}
