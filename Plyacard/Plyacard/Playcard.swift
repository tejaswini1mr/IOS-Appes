//
//  Playcard.swift
//  Plyacard
//
//  Created by Tejaswini MR on 11/03/21.
//

import Foundation

struct Playcard {
    var suit :Suit
    var rank :Rank
    
    enum Suit: String{
        case spades = "♠️"
        case heart = "♥️"
        case diamond = "♦️"
        case clubs = "♣️"
        
        static var all: [Suit] = [.clubs,.diamond,.heart,.spades]
    }
    enum Rank{
        case ace
        case face(String)
        case numeric(Int)
        
        var order: Int {
            switch self {
            case .ace:
                return 1
            case .numeric(let pips):
                return pips
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "Q": return 13
            default:
                return 0
            }
        }
        static var all: [Rank] {
            var allRank = [Rank.ace]
            for pips in 2...10{
                allRank.append(Rank.numeric(pips))
            }
            allRank += [Rank.face("J"),Rank.face("Q"),Rank.face("K")]
            return allRank
        }
        
    }
}
