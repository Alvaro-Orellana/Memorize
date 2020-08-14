//
//  FormView.swift
//  Memorize
//
//  Created by Alvaro Orellana on 09-08-20.
//  Copyright © 2020 Alvaro Orellana. All rights reserved.
//

import SwiftUI

struct FormView: View {
    
    @State var isOn = false
    @State var textFieldText = "This is the text"
    
    var body: some View {
        Form {
            Section{
                Text("Title of the form")
                    .font(.largeTitle)
            }
            
            Section{
                HStack{
                    Image(systemName: "person.crop.circle")
                        .font(.largeTitle)
                        
                    VStack(alignment: .leading){
                        Text("Nombre usuario")
                        Text("Apple ID iCloud, iTunes & App Store")
                    }
                }
            }
            
            Section{
                SectionRow(imageName: "airplane", text: "Airplane mode")
                SectionRow(imageName: "wifi", text: "Fibertel WiFi702 5.8Ghz")
                SectionRow(imageName: "antenna.radiowaves.left.and.right", text: "Not Connected")
                SectionRow(imageName: "gamecontroller.fill", text: "On")
                Circle()
                Toggle(isOn: $isOn) { Text("Mi toggle") }
                Stepper(onIncrement: {}, onDecrement: {}) {
                    Text("Mi stepper")
                }
                TextField("MI textfield", text: $textFieldText)
                
                
                
            }
            
            Section{
                SectionRow(imageName: "airplane", text: "Airplane mode")
                SectionRow(imageName: "wifi", text: "Fibertel WiFi702 5.8Ghz")
                SectionRow(imageName: "antenna.radiowaves.left.and.right", text: "Not Connected")
                SectionRow(imageName: "gamecontroller.fill", text: "On")
                Color.pink
            }
        }
    }
}

struct SectionRow: View {
    
    let imageName: String
    let text: String
    
    var body: some View {
        HStack{
            Image(systemName: imageName)
            .padding()
                .background(RoundedRectangle(cornerRadius: 70).stroke())
            
            Text(text)
            Spacer()
            Text("Not connected")
        }
    }
}


struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}

