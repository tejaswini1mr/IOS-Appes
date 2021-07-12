//
//  Cards.swift
//  SetGame
//
//  Created by Tejaswini MR on 17/03/21.
//

import Foundation
import UIKit
enum cardColor{
    case green
    case red
    case yellow
    
    static let allvalues = [green,red,yellow] //enum should not contatn stored values
}
enum cardShape{
    case triangle
    case square
    case circle
    
    static let allValues = [triangle,square,circle]
}
enum cardShades{
    case solid
    case stripped
    case open
    
    static let allValues = [solid,stripped,open]
}
enum cardNumber{
    case one
    case two
    case three
    
    static let allValues = [one,two,three]
}
struct Cards: Equatable {
    static func ==(lhs: Cards, rhs: Cards) -> Bool {
            return lhs.cardcolor == rhs.cardcolor &&
                lhs.cardnumber == rhs.cardnumber &&
                lhs.cardshades == rhs.cardshades &&
                lhs.cardshades == rhs.cardshades
        }
    let cardcolor: cardColor
    let cardnumber: cardNumber
    let cardshades: cardShades
    let cardshapes: cardShape
}
