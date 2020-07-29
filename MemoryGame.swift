//
//  MemoryGame.swift
//  Memorize
//
//  Created by Alvaro Orellana on 27-07-20.
//  Copyright © 2020 Alvaro Orellana. All rights reserved.
//

import Foundation

//This is the model of the game
struct MemoryGame<CardContent> {
    
    var cards: [Card] = []
    
    
    init(numberOfPairsOfCards: Int, cardContent: (Int) -> CardContent) {
        for pairIndex in 0..<numberOfPairsOfCards {
            
            let content = cardContent(pairIndex)
            
            cards.append(Card(id: pairIndex * 2 , content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
            
            cards.shuffle()
        }
    }
    
    
    mutating func chooseCard(_ card: Card) {
        print("the chosen card was \(card)")
        if let chosenIndex = findIndex(of: card){
            //Toggles the isFaceUp property to its opposite
            cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
        }
    }
    
    func findIndex(of card: Card) -> Int? {
        for cardIndex in 0..<cards.count {
            if cards[cardIndex].id == card.id {
                return cardIndex
            }
        }
        return nil
    }
    
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
    }
}
