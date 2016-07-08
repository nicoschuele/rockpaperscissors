//
//  Game.swift
//  Rock Paper Scissors
//
//  Created by Nico Schuele on 08/07/16.
//  Copyright © 2016 Nico Schuele. All rights reserved.
//

import Foundation

enum GameResult {
    case Win, Lose, Tie
}

struct Game {
    
    // Compares two hands to determine win, lose or tie
    static func comparePlayerHand(hand: Hand, withOpponent versus: Hand) -> GameResult {
        switch (hand.name, versus.name) {
        case ("rock", "paper"), ("paper", "scissors"), ("scissors", "rock"):
            return .Lose
        case ("rock", "scissors"), ("paper", "rock"), ("scissors", "paper"):
            return .Win
        default:
            return .Tie
        }
    }
    
    // Returns a random hand
    static func randomDraw() -> Hand {
        let random = arc4random_uniform(2)
        switch random {
        case 0:
            return Hands.rock
        case 1:
            return Hands.paper
        case 2:
            return Hands.scissors
        default:
            return Hands.rock
        }
    }

}

