//
//  GameView.swift
//  GuessPersonality
//
//  Created by Saqib Bhatti on 25/7/24.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var matchManager: MatchManager
    @State var drawingGuess = ""
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    GameView(matchManager: MatchManager())
}
