//
//  GameEngine.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class GameEngine {
    var player1: Player
    var player2: Player
    var deck: Deck
    
    init(player1name: String, player2name: String) {
        let deck = Deck()
        
        let deck1 = deck.split().0
        let deck2 = deck.split().1
        
        let hand1 = Hand(cards: deck1)
        let hand2 = Hand(cards: deck2)
        
        let player1 = Player(name: player1name, hand: hand1)
        let player2 = Player(name: player2name, hand: hand2)
        
        self.player1 = player1
        self.player2 = player2
        self.deck = deck
    }
    
    func playerOneTurn() -> (Player?, Card?, Card?) {
        let player1Card = self.player1.flip()
        let player2Card = self.player2.flip()
        
        if (player1Card?.rank.rawValue)! > (player2Card?.rank.rawValue)! {
            return (player1, player1Card, player2Card)
        } else if (player1Card?.rank.rawValue)! == (player2Card?.rank.rawValue)! {
            return (nil, player1Card, player2Card)
        } else {
            return (player2, player1Card, player2Card)
        }
    }
    func award(cards: [Card], to player: Player) {
        for card in cards {
            player.give(card: card)
        }
    }
    func gameOver() -> Bool {
        if self.player1.hasCards() == false || self.player1.hasCards() == false {
            return true
        } else {
            return false
        }
    }
    
    
}


