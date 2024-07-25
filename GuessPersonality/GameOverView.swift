//
//  GameOverView.swift
//  GuessPersonality
//
//  Created by Saqib Bhatti on 25/7/24.
//

import SwiftUI

struct GameOverView: View {
    @ObservedObject var matchManager: MatchManager
    
    var body: some View {
        ZStack {
            Color(red: 35/255, green: 200/255, blue: 237/255)
                .ignoresSafeArea()
            
            VStack {
                Image("game-over")
                .resizable()
                .scaledToFit()
                .padding(20)
                
                Text("Score: \(matchManager.score)")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                
                Button {
                    // To Dod
                } label: {
                    Text("Menu")
                        .foregroundStyle(Color.white)
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                }
                .padding()
                .padding(.horizontal, 50)
                .background(
                    Capsule(style: .circular)
                        .fill(Color(red: 89/255, green: 185/255, blue: 139/255)))
            }
        }
        
    }
}

#Preview {
    GameOverView(matchManager: MatchManager())
}
