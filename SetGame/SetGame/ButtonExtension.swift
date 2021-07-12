//
//  ButtonExtension.swift
//  SetGame
//
//  Created by Tejaswini MR on 17/03/21.
//
import UIKit
extension UIButton{
    func isSelected()->Bool{
        return self.layer.borderWidth == 4.0
    }
    func select(borderColor:UIColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)){
        self.layer.borderWidth = 4.0
        self.layer.borderColor = borderColor.cgColor
        self.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    }
    func deselct(){
        self.layer.borderWidth = 2.0
                self.layer.borderColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
                self.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
