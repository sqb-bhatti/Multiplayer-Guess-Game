//
//  Misc.swift
//  GuessPersonality
//


import Foundation


let words = ["pen", "paper", "book",
             "table", "chair", "computer", "phone", "keys",
             "wallet", "watch", "clock", "lamp", "bed",
             "pillow", "blanket", "sofa", "tv", "remote",
             "car", "bicycle", "bus", "train", "plane",
             "umbrella", "sunglasses", "shoe", "pants",
             "shirt", "hat", "coat", "gloves", "scarf",
             "socks", "toothbrush", "toothpaste", "soap",
             "shampoo", "conditioner", "razor", "towel",
             "dish", "silverware", "glass", "plate",
             "microwave", "fridge", "stove", "oven",
             "dishwasher", "machine", "dryer", "vacuum",
             "cleaner", "mop", "broom", "dustpan", "trash",
             "basket", "hanger", "iron", "hairbrush",
             "comb", "scissors", "tape", "nails",
             "glue", "stapler", "paperclip", "binder",
             "folder", "envelope", "calendar", "directory",
             "whiteboard", "marker", "eraser", "pencil",
             "ruler", "compass", "calculator", "protractor",
             "flashlight", "battery", "extension", "power",
             "flashlight", "battery", "extension", "power"
            ]




enum playerAuthState: String {
    case authenticating = "Logging into Game Center..."
    case unauthenticated = "Please sign in to Game Center to play"
    case authenticated = ""
    
    case error = "There was an error logging into Game Center"
    case restricted = "You are not allowed to play multiplayer games!"
}



struct PastGuess: Identifiable {
    let id = UUID()
    var message: String
    var correct: Bool
}


let maxTimeRemaining = 100
