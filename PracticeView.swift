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
        VStack(spacing: 20) {
            
            Text("VStack").font(.largeTitle)
            Text("Introduction")
                .foregroundColor(.gray)
            
            Text("View stacks are vew that contain other views")
                .frame(maxWidth: .infinity, minHeight: 70)
                .background(Color.blue)
                .foregroundColor(.white)
            
            Text("The containing the views are stacked vertically")
                .frame(maxWidth: .infinity)

            RectangleExample(alignment: .center)

        }
        .font(.title)
    }
}

struct RectangleExample: View {
    var alignment: HorizontalAlignment
    var body: some View {
        VStack(alignment: alignment, spacing: 20) {
            Text("VStack inside another VStack")
            Text("This can be handy why?")
            Text("More than 10 view creates an error")

        }
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(10)
        .padding()

    }
}


struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView()
    }
}
