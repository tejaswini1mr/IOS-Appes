//
//  ViewController.swift
//  SetGame
//
//  Created by Tejaswini MR on 16/03/21.
//

import UIKit

class ViewController: UIViewController {
    var setgame = SetCards()

    @IBOutlet var setCardButton: [UIButton]!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var dealWith3morecard: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButtons()
        updateViewFromModel()
    }
    func resetButtons() {
            for buttonIndex in setCardButton.indices {
                let button = setCardButton[buttonIndex]
                button.deselct()
                button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
                button.layer.cornerRadius = 10
                button.backgroundColor = #colorLiteral(red: 1, green: 0.5768225789, blue: 0, alpha: 0)
                button.layer.borderColor =  #colorLiteral(red: 1, green: 0.5768225789, blue: 0, alpha: 0)
                button.setAttributedTitle(nil, for: UIControl.State.normal)
            }
        }

        @IBAction private func selectCard(_ sender: UIButton) {
            if let cardIndex = setCardButton.index(of: sender) {
                if cardIndex < setgame.cardsInGame.count {
                    setgame.select(card: setgame.cardsInGame[cardIndex])
                }
                updateViewFromModel()
            }
        }
        
    func updateViewFromModel() {
        var cardbuttonIndex = 0
        resetButtons()
        for card in setgame.cardsInGame{
            let button = setCardButton[cardbuttonIndex]
            print(button)
            ButtonRender.renderCard(ofCard: card, onbutton: button,isSet:setgame.cardIsSelected(card: card) , selectButton: setgame.isSet())
            cardbuttonIndex += 1
        }
    }

}

