//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Alvaro Orellana on 27-07-20.
//  Copyright © 2020 Alvaro Orellana. All rights reserved.
//

import Foundation

//This is the ViewModel
class EmojiMemoryGame: ObservableObject {
    
    @Published private var model = memoryGameFactory()
    
    static func memoryGameFactory() -> MemoryGame<String> {
        let emojis = ["🦊", "🙈", "🐯", "🐮", "🐸", "🐷", "🐣", "🐨", "🐔", "🦞", "🐬", "🦄 "]
        let numberOfPairs = Int.random(in: 2...5)
        
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairs) { pairIndex in
            let randomEmojiIndex = Int.random(in: 0..<emojis.count)
            return emojis[randomEmojiIndex]
        }
    }
    
    
    //MARK: - User Intents
    func chooseCard(_ card: MemoryGame<String>.Card)  {
        model.chooseCard(card)
    }
    
    
    
    //MARK: - Model Access
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
}
