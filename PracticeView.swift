//
//  PracticeView.swift
//  Memorize
//
//  Created by Alvaro Orellana on 30-07-20.
//  Copyright © 2020 Alvaro Orellana. All rights reserved.
//

import SwiftUI

struct PracticeView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Geometry Reader")
                .font(.largeTitle)
            
            Text("Min Mid Max")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("You can also get the minimum (min), middle (mid), and maximum (max) X and Y coordinate from the geometry readerBooks.")
            
            GeometryReader { geometry in
                VStack{
                    Text("Local coordinate space")
                    HStack{
                        Text("Min: \(Int(geometry.frame(in: .local).minX))")
                        Spacer()
                        Text("Mid: \(Int(geometry.frame(in: .local).midX))")
                        Spacer()
                        Text("Max: \(Int(geometry.frame(in: .local).maxX))")
                    }
                    
                    Text("Global coordinate space")
                    HStack{
                        Text("Min: \(Int(geometry.frame(in: .global).minX))")
                        Spacer()
                        Text("Mid: \(Int(geometry.frame(in: .global).midX))")
                        Spacer()
                        Text("Max: \(Int(geometry.frame(in: .global).maxX))")
                    }
                    }
                .padding()
                .foregroundColor(.white)
            }
            .background(Color.pink)
            
            
            HStack {
                GeometryReader { geometry in
                    VStack{
                        
                        Text("Min: \(Int(geometry.frame(in: .local).minY))")
                        Spacer()
                        Text("Mid: \(Int(geometry.frame(in: .local).midY))")
                        Spacer()
                        Text("Max: \(Int(geometry.frame(in: .local).maxY))")
                        Spacer()
                        
                    }
                    .foregroundColor(.white)
                }
                .background(Color.pink)
                
                GeometryReader { geometry in
                    VStack{
                        
                        Text("Min: \(Int(geometry.frame(in: .global).minY))")
                        Spacer()
                        Text("Mid: \(Int(geometry.frame(in: .global).midY))")
                        Spacer()
                        Text("Max: \(Int(geometry.frame(in: .global).maxY))")
                        Spacer()
                        
                    }
                    .foregroundColor(.white)
                }
                .background(Color.pink)
            }
        
        }
        .padding()
    }
}



struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView()
    }
}
