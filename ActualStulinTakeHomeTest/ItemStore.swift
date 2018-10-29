//
//  ItemStore.swift
//  ActualStulinTakeHomeTest
//
//  Created by ws on 10/28/18.
//  Copyright © 2018 ws. All rights reserved.
//

import UIKit

class ItemStore{
    
    var allItems = [Item]()
    
    @discardableResult func createItem() -> Item{
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }

    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    
}

