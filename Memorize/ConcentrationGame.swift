//
//  GridLayout.swift
//  Memorize
//
//  Created by Alvaro Orellana on 02-08-20.
//  Copyright © 2020 Alvaro Orellana. All rights reserved.
//


import Foundation

struct ConcentrationGame<CardContent> where CardContent: Equatable {
    
    var cards = [Card]()
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get{
            cards.indices.filter { cards[$0].isFaceUp }.onlyOne
        }
        set{
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    
    init(numberOfPairsOfCards: Int, cardContent: (Int) -> CardContent) {
        for pairIndex in 0..<numberOfPairsOfCards {
           
            let content = cardContent(pairIndex)
           
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
            cards.append(Card(id: pairIndex * 2 + 2, content: content))
        }
        cards.shuffle()
    }
    
    
    
    //MARK: - Game's Logic
    
    mutating func touchCard(_ card: Card) {
        if let chosenIndex = firstIndexMatching(card) {
            
            if !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
                
                if let potencialFaceUpIndex = indexOfTheOneAndOnlyFaceUpCard {
                    //There one face up card
                    
                    cards[potencialFaceUpIndex].isFaceUp = true
                    
                    //Check if there's a match
                    if cards[potencialFaceUpIndex].content == cards[chosenIndex].content {
                        cards[potencialFaceUpIndex].isMatched = true
                        cards[chosenIndex].isMatched = true
                    }
                    
                } else {
                    //There are two cards face up or all of them are face down
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
            }
        }
    }
    
    
    func firstIndexMatching(_ card: Card) -> Int? {
        for index in cards.indices {
            if cards[index].id == card.id {
                return  index
            }
        }
        return nil
    }
    
    
    struct Card{
        var id: Int
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
    
}
