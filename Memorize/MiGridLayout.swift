//
//  GridLayout.swift
//  Memorize
//
//  Created by Alvaro Orellana on 02-08-20.
//  Copyright © 2020 Alvaro Orellana. All rights reserved.
//

import UIKit

struct MiGridLayout {
    let itemCount: Int
    let viewSize: CGSize
    let desiredAspectRatio: Double
    let numberOfColumns = 2
    
    
    
    init(itemCount: Int, desiredAspectRatio: Double = 1, in size: CGSize) {
        self.itemCount = itemCount
        self.desiredAspectRatio = desiredAspectRatio
        self.viewSize = size
        print("The number of cards is \(itemCount)")
        
    }
    
    
    
    var itemSize: CGSize {
        let itemWidth = viewSize.width / CGFloat(numberOfColumns)
        let itemHeight = viewSize.height / CGFloat(itemCount/numberOfColumns)
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    
    
    func location(ofItemAt index: Int) -> CGPoint {
        
        //if is even
        if index % 2 == 0 {
            let x = 0.0
            let y = Double(itemSize.height) * Double(index / 2)
            print("For item at index \(index) its coordenates are x: \(x), y: \(y)")
            return CGPoint(x: x, y: y)
            
        } else {
            //if is odd
            let x = Double(itemSize.width) 
            let y = Double(itemSize.height) * Double(index / 2)
            print("For item at index \(index) its coordenates are x: \(x), y: \(y)")
            return CGPoint(x: x, y: y)
        }
        
    }
    
}
