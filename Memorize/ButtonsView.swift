//
//  ButtonsView.swift
//  Memorize
//
//  Created by Alvaro Orellana on 01-08-20.
//  Copyright © 2020 Alvaro Orellana. All rights reserved.
//

import SwiftUI

struct ButtonsView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Button(action: {print("Button pressed")}) {
                    Text("Primer button")
                    
                    Image(systemName: "phone")
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(25)
                
                
                Button("simple buttom"){
                    print("simple button touched")
                }
                
                
                Button(action: {print("button with rounded corners was touched")}) {
                    Text("Whatsup yall")
                        .frame(width: 200, height: 50)
                        
                        .background(RoundedRectangle(cornerRadius: 24).stroke(Color.pink))
                }
                
                Button(action: {print("REcord button pressed")}) {
                    VStack {
                        Image(systemName: "video.circle")
                        
                        Text("Record")
                            .padding(.horizontal)
                    }
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(50)
                }
                
                
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: {}){
                        Image(systemName: "plus ")
                            .font(.title)

                    }
                .padding(20)
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(.greatestFiniteMagnitude)

                }
                .padding(.trailing, 30)

            
            }
        }
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}
