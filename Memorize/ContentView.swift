//
//  ContentView.swift
//  Memorize
//
//  Created by Alvaro Orellana on 27-07-20.
//  Copyright © 2020 Alvaro Orellana. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        GridView(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.chooseCard(card)
                }
                .padding()
        }
        
    .padding()
        

    }
}


struct CardView: View {
    
    var card: MemoryGame<String>.Card
    var body: some View {
        
        GeometryReader { geometry in
            ZStack{
                if self.card.isFaceUp {
                    RoundedRectangle(cornerRadius: 15).foregroundColor(.white)
                    RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 3)
                    Text(self.card.content)
                } else {
                    if !self.card.isMatched {
                        RoundedRectangle(cornerRadius: 15).fill()

                    }
                }
                
            }
            .foregroundColor(.orange)
            .font(.system(size: min(geometry.size.width, geometry.size.height) * 0.75 ))
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
