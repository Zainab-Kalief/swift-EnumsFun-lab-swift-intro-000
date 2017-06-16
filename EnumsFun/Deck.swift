//
//  Deck.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Deck {
    var cards: [Card]
    
    init() {
        var cards: [Card] = []
        for rank in [2,3,4,5,6,7,8,9,10,11,12,13,14] {
            for suit in ["♣️","♠️","♦️","❤️"] {
                let card = Card(suit: Suit(rawValue: suit)!, rank: Rank(rawValue: rank)!)
                cards.append(card)
            }
        }
        
        self.cards = cards
        self.cards.shuffle()
    }
    
    func split() -> ([Card],[Card]){
      let splitCards =  cards.split()
        return (splitCards.0, splitCards.1)
    }
  
}


