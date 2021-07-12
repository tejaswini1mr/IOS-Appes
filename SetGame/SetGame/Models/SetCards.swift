//
//  setCard.swift
//  SetGame
//
//  Created by Tejaswini MR on 17/03/21.
//

import Foundation

class SetCards {
    var availableCards = [Cards]()
    var cardsInGame = [Cards]()
    var selectedCards = [Cards]()
    var score = 0
    init() {
        newGame()
    }
    
    func newGame(){
        availableCards.removeAll()
        cardsInGame.removeAll()
        selectedCards.removeAll()
        generateCardsWithAllCobination()
        print(availableCards.count)
        displayGamingCards(numberofCard:12)
        print(cardsInGame.count)
    }
    func generateCardsWithAllCobination(){
        for cardColor in cardColor.allvalues{
            for cardShape in cardShape.allValues{
                for cardShade in cardShades.allValues{
                    for cardNum in cardNumber.allValues{
                        let card = Cards(cardcolor: cardColor, cardnumber: cardNum, cardshades: cardShade, cardshapes: cardShape)
                        availableCards.append(card)

                    }
                }
            }
        }
    }
    
    func displayGamingCards(numberofCard:Int){
        for _ in 0..<numberofCard{
            addCard()
        }
    }

    func addCard(){
        if availableCards.count != 0{
            cardsInGame.append(availableCards.remove(at: availableCards.count.arc4random))
        }
    }
    func cardIsSelected(card: Cards) -> Bool {
           return selectedCards.index(of: card) != nil
       }
    func isSet()->Bool{
        if selectedCards.count < 3{
            return false
        }
        if selectedCards[0].cardcolor == selectedCards[1].cardcolor {
                    if selectedCards[0].cardcolor != selectedCards[2].cardcolor {
                        return false
                    }
                } else if selectedCards[1].cardcolor == selectedCards[2].cardcolor {
                    return false
                } else if (selectedCards[0].cardcolor == selectedCards[2].cardcolor) {
                    return false
                }
                
                if selectedCards[0].cardnumber == selectedCards[1].cardnumber {
                    if selectedCards[0].cardnumber != selectedCards[2].cardnumber {
                        return false
                    }
                } else if selectedCards[1].cardnumber == selectedCards[2].cardnumber {
                    return false
                } else if (selectedCards[0].cardnumber == selectedCards[2].cardnumber) {
                    return false
                }
                
                if selectedCards[0].cardshades == selectedCards[1].cardshades {
                    if selectedCards[0].cardshades != selectedCards[2].cardshades {
                        return false
                    }
                } else if selectedCards[1].cardshades == selectedCards[2].cardshades {
                    return false
                } else if (selectedCards[0].cardshades == selectedCards[2].cardshades) {
                    return false
                }
                
                if selectedCards[0].cardshapes == selectedCards[1].cardshapes {
                    if selectedCards[0].cardshapes != selectedCards[2].cardshapes{
                        return false
                    }
                } else if selectedCards[1].cardshapes == selectedCards[2].cardshapes{
                    return false
                } else if (selectedCards[0].cardshapes == selectedCards[2].cardshapes) {
                    return false
                }
                
                return true
    }
    func select(card: Cards) {
            if selectedCards.count == 3 && isSet() {
                selectedCards.forEach {
                    if let selectedCardInGameIndex = cardsInGame.index(of: $0) {
                        cardsInGame.remove(at: selectedCardInGameIndex)
                        if availableCards.count > 0 {
                            let selectedCard = availableCards.remove(at: availableCards.count.arc4random)
                            cardsInGame.insert(selectedCard, at: selectedCardInGameIndex)
                        }
                    }
                }
                selectedCards.removeAll()
                score += 3
            } else if selectedCards.count == 3 && !isSet() {
                selectedCards.removeAll()
                score -= 1
            }
            
            if let cardToSelect = selectedCards.index(of: card) {
                // Card is already selected, so remove it from the selection
                selectedCards.remove(at: cardToSelect)
            } else {
                selectedCards.append(card)
            }
            
            print("Selected \(selectedCards.count) cards")
            print("Cards available in deck \(availableCards.count) cards")
            print("Cards in game \(cardsInGame.count) cards")
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
