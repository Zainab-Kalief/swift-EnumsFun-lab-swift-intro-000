//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
    case heart = "❤️", diamond = "♦️", club = "♣️", spade = "♠️"

}

enum Rank: Int {
    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
 
    var stringValue: String {
        switch self {
        case .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten:
            return "\(self.rawValue)"
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        case .ace:
            return "A"
        }
    }
}

class Card {
    var suit: Suit
    var rank: Rank
    var description: String {
        return "\(suit.rawValue)\(rank.stringValue)"
    }
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank 
    }
    
}
