//
//  ViewController.swift
//  Plyacard
//
//  Created by Tejaswini MR on 11/03/21.
//

import UIKit

class ViewController: UIViewController {
    var deck = PlayingCardDeck()
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 1...10 {
            let card = deck.draw()
            print(card!)
        }
    }


}

