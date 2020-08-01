//
//  MemoryGame.swift
//  Memorize
//
//  Created by Alvaro Orellana on 27-07-20.
//  Copyright © 2020 Alvaro Orellana. All rights reserved.
//

import Foundation

//This is the model of the game
struct MemoryGame<CardContent> where CardContent: Equatable {
    
    var cards = [Card]()
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
             //If there's only one face up card in the whole array returns it's index, else returns nil
            cards.indices.filter { index in cards[index].isFaceUp }.onlyOne
        }
        set {
            for index in cards.indices {
                //Turns all the cards face down except for the one whose index is the new setted value
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    
    init(numberOfPairsOfCards: Int, cardContent: (Int) -> CardContent) {
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContent(pairIndex)
            
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
            cards.append(Card(id: pairIndex * 2 + 2, content: content))
            cards.shuffle()
        }
    }
    
    
    mutating func chooseCard(_ card: Card) {
    
        //Finds the index of the card touched by the user
        if let chosenIndex = findFirstIndex(matching: card) {
            
            //Enters this if, only when the card touched by the user is face down and not matched
            //meaning acts as if the user didnt touch anything
            if !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched  {
                
                if let potentialIndex = indexOfTheOneAndOnlyFaceUpCard {
                   
                    cards[chosenIndex].isFaceUp = true
                    
                    //Check if there's a match
                    if cards[potentialIndex].content == cards[chosenIndex].content {
                        cards[potentialIndex].isMatched = true
                        cards[chosenIndex].isMatched = true
                    }
                    
                } else {
                    //The cards we either all face down, or two were face up
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                    print("The index of the faceup card now is \(chosenIndex)")
                }
                
            }
        }
        
    }
    
    
    func findFirstIndex(matching card: Card) -> Int? {
        for cardIndex in 0..<cards.count {
            if cards[cardIndex].id == card.id {
                return cardIndex
            }
        }
        return nil
    }
    
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
}


//MARK: - Extension Array

//Used in the model to return the one and only face up card, or nil if there's no such card
//the model uses .filter to make this happen
extension Array {
    var onlyOne: Element? {
        return  count == 1 ? first : nil
    }
}
