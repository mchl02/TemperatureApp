//
//  ItemStore.swift
//  ActualStulinTakeHomeTest
//
//  Created by ws on 10/28/18.
//  Copyright © 2018 ws. All rights reserved.
//

import UIKit

class ItemStore{
    
    var allLogs = [Item]()
    var nextID = 0
    @discardableResult func createLog(dateFormatter: DateFormatter, numberFormatter:NumberFormatter) -> Item {
        let newLog = Item( id: numberFormatter.string(from: NSNumber(value: nextID))!, date: dateFormatter.string(from: Date()))
        allLogs.append(newLog)
        nextID += 1
        return newLog
    }
    var allItems = [Item]()
    
    func removeItem(_ item: Item) {
        if let index = allItems.index(of: item) {
            allItems.remove(at: index)
        }
    }
    
    
    
    

    
    
}

