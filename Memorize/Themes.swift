//
//  Themes.swift
//  Memorize
//
//  Created by Alvaro Orellana on 12-08-20.
//  Copyright © 2020 Alvaro Orellana. All rights reserved.
//

import SwiftUI

struct Themes: View {
    
    //@ObservedObject var viewModel: EmojiMemoryGame
    var themes =  Array(EmojiMemoryGame.gameThemes.keys)

    
    var body: some View {
        NavigationView{
            List(themes, id: \.self) {  theme in
                NavigationLink(destination: ContentView(viewModel: EmojiMemoryGame(chosenTheme: theme) )) {
                    HStack  {
                        Spacer()
                        Text(theme)
                        Spacer()
                    }
                }
                    
                    
                    
                .padding(.vertical)
            }
            .font(.title)
            .navigationBarTitle(Text("Memorize"))
        }
   
        
        
    }
}





struct Themes_Previews: PreviewProvider {
    static var previews: some View {
        Themes()
    }
}
