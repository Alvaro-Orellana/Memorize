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
    
    @Published private  var model: MemoryGame<String>
    
    var gameTheme: String
    
    init(chosenTheme: String) {
        model = EmojiMemoryGame.memoryGameFactory(theme: chosenTheme)
        gameTheme = chosenTheme
    }
    
    //Game Themes
    static var gameThemes = ["Animals": animalEmojis, "Halloween" : halloweenEmojis, "Sports": sportsEmojis, "Faces": facesEmojis, "Food": foodEmojis]

    static let animalEmojis = ["🦊", "🙈", "🐯", "🐮", "🐸", "🐷", "🐣", "🐨", "🐔", "🦞", "🐬", "🦄 "]
    static let halloweenEmojis = ["👻", "🎃", "🕷", "💀", "🍭", "👾", "🧟‍♂️"]
    static let sportsEmojis = ["🏈", "🏀", "⚽️", "🎾", "⚾️", "🏐", "🏓", "🏑", "⛳️"]
    static let facesEmojis = ["😀", "😡", "🥶", "🥺", "🤓", "🤮", "🙄", "😵", "🤫",]
    static let foodEmojis = ["🍔", "🌭", "🌮", "🍕", "🌯", "🍟", "🍗", "🥞", "🧆",]



    static func memoryGameFactory(theme: String) -> MemoryGame<String> {
        let numberOfPairs = Int.random(in: 2...5)
        let selectedTheme = EmojiMemoryGame.gameThemes[theme]!

        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairs) { pairIndex in
            let randomEmojiIndex = Int.random(in: 0..<selectedTheme.count)
            return selectedTheme[randomEmojiIndex]
        }
    }
    
    
    //MARK: - User Intents
    
    func chooseCard(_ card: MemoryGame<String>.Card)  {
        model.chooseCard(card)
    }
    

    func newGame() {
        //Get all the keys of gameThemes in an array
        let themesArray = Array(EmojiMemoryGame.gameThemes.keys)
        
        //Select theme at random
        let randomIndex = Int.random(in: 0..<themesArray.count)
        let newTheme = themesArray[randomIndex]
        
        //Create new game
        model = EmojiMemoryGame.memoryGameFactory(theme: newTheme)
        gameTheme = newTheme
        print("NEW GAME!! with a theme of \(newTheme)")

    }
    
    
    
    //MARK: - Model Access
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    
    func gameScore() -> Int {
        return model.score
    }
}
