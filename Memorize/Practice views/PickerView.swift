//
//  PickerView.swift
//  Memorize
//
//  Created by Alvaro Orellana on 07-08-20.
//  Copyright © 2020 Alvaro Orellana. All rights reserved.
//

import SwiftUI

struct PickerView: View {
    
    @State var nextFullMoon = Date()
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Date Picker")
                .font(.largeTitle)
            Text("Your own title")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("Even when you add your own title, you still have the problem with the date piciking ndenting.")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow)
            
            VStack {
                Text("Tittle of the Picker").font(.title)
                DatePicker("", selection: $nextFullMoon, displayedComponents: [.hourAndMinute, .date])
                .labelsHidden()
                
            }
            
            Text("How can you prevent the indenting ?")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow)
                .font(.title)
            
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
