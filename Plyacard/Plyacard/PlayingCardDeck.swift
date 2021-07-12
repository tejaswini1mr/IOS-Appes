//
//  PlayingCardDeck.swift
//  Plyacard
//
//  Created by Tejaswini MR on 14/03/21.
//

import Foundation

struct PlayingCardDeck{
    private(set) var card = [PlayingCard]()
    
    init() {
        for suit in PlayingCard.Suit.all{
            for rank in PlayingCard.Rank.all{
                card.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
    
    mutating func draw() -> PlayingCard? {
        if card.count > 0{
            return card.remove(at:card.count.arc4random)
        }else {
            return nil
        }
    }
}
extension Int {
    var arc4random: Int {
        if self > 0{
        return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0{
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }else {
            return 0
        }
        
    }
}

