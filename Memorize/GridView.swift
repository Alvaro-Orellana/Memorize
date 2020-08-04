//
//  GridView.swift
//  Memorize
//
//  Created by Alvaro Orellana on 02-08-20.
//  Copyright © 2020 Alvaro Orellana. All rights reserved.
//

import SwiftUI

struct GridView<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    
    
    func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            self.body(for: item, in: layout)
        }
    }
    
    
    
    func body(for item: Item, in layout: GridLayout) -> some View {
        let itemIndex = index(of: item)
        return Group {
            if itemIndex != nil {
                viewForItem(item)
                    .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                    .position(layout.location(ofItemAt: itemIndex!))
            }
        }
    }
    
    
    func index(of item: Item) -> Int? {
        for index in items.indices {
            if items[index].id == item.id {
                return index
            }
        }
        return nil
    }
}

