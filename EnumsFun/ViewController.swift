//
//  ViewController.swift
//  EnumsFun
//
//  Created by Jim Campagno on 7/20/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var opponentCardLabel: UILabel!
    @IBOutlet weak var playerCardLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var opponentScoreLabel: UILabel!
    @IBOutlet weak var flipCardButton: UIButton!
    
    var cardContainer: [Int: [Card]] = [:]
    var number = 0
    
    let players = GameEngine(player1name: "Kayode", player2name: "Wura")
    
    
    
    @IBAction func flipCard(_ sender: UIButton) {
        let oneTurn = players.playerOneTurn()
        
        opponentCardLabel.text = oneTurn.1?.description
        playerCardLabel.text = oneTurn.2?.description
        
        if oneTurn.0 == nil {
            cardContainer[cardContainer.count + 1] = [oneTurn.1!, oneTurn.2!]
            winnerLabel.text = "Draw"
        } else {
            players.award(cards: [oneTurn.1!,oneTurn.2!], to: oneTurn.0!)
            if !cardContainer.isEmpty {
                for cards in cardContainer.values {
                    players.award(cards: cards, to: oneTurn.0!)
                }
                cardContainer.removeAll()
            }
            winnerLabel.text = oneTurn.0?.name
        }
        
        opponentScoreLabel.text = "\(players.player1.hand.size)"
        playerScoreLabel.text = "\(players.player2.hand.size)"
        
        if players.gameOver() == true {
            flipCardButton.isEnabled = false
            winnerLabel.text = "GAME OVER!!!"
        }
    }
    
   
    
}
