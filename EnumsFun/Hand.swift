//
//  Hand.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Hand {
    var cards: [Card]
    var size: Int {
        return cards.count
    }
    init(cards: [Card]) {
        self.cards = cards
    }
    
    func flip() -> Card? {
        if !cards.isEmpty {
            return cards.remove(at: 0)
        } else {
            return nil
        }
    }
    func give(card: Card) {
        cards.append(card)
    }
    func lose(card: Card) {
        for (index, playerCard) in cards.enumerated() {
            if playerCard.rank.rawValue == card.rank.rawValue {
                cards.remove(at: index)
            }
        }
    }
    
}
