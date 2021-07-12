//
//  ButtonRender.swift
//  SetGame
//
//  Created by Tejaswini MR on 17/03/21.
//

import Foundation
import UIKit

class ButtonRender{
    private static func getShape(ofCard card:Cards)->String{
        switch card.cardshapes{
        case .circle:
            return "●"
        case .square:
            return "■"
        case .triangle:
            return "▲"
        }
    }
   private static func getColor(ofCard card:Cards)->UIColor{
        switch card.cardcolor {
        case .green:
           return  UIColor.black
        case .red:
            return UIColor.red
        case .yellow:
            return UIColor.purple
        }
    }
    private static func getButtonAttributedTitle(ofCard card: Cards, withTitle title: String, withColor color: UIColor) -> NSAttributedString {
            
        var attributes: [NSAttributedString.Key: Any] = [:]
            
        switch card.cardshades {
            case .open:
                attributes[.strokeWidth] = 4
                attributes[.foregroundColor] = color
            case .solid:
                attributes[.strokeWidth] = -1
                attributes[.foregroundColor] = color
        case .stripped:
                attributes[.strokeWidth] = -1
                attributes[.foregroundColor] = color.withAlphaComponent(0.25)
            }
            
            return NSAttributedString(string: title, attributes: attributes)
        }
    private static func getNumberOfAttribute(ofCard card: Cards,withShape symbol: String ) -> String {
        switch card.cardnumber {
        case .one:
            return "\(symbol)"
        case .two:
            return "\(symbol)\(symbol)"
        case .three:
            return "\(symbol)\(symbol)\(symbol)"
        
        }
    }
    public static func renderCard(ofCard card: Cards,onbutton sender: UIButton,isSet: Bool,selectButton: Bool){
        let cardColor = getColor(ofCard: card)
        let cardShape = getShape(ofCard: card)
        let shapnumber = getNumberOfAttribute(ofCard: card, withShape: cardShape)
        let attributedTitle = getButtonAttributedTitle(ofCard: card, withTitle: shapnumber, withColor: cardColor)
        
        sender.setAttributedTitle(attributedTitle, for: UIControl.State.normal)
        if selectButton {
                    if isSet {
                        sender.select(borderColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
                    } else {
                        sender.select()
                    }
                } else {
                    sender.deselct()
                }

    }
        
}
