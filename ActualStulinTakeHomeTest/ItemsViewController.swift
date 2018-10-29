//
//  ItemsViewController.swift
//  ActualStulinTakeHomeTest
//
//  Created by ws on 10/28/18.
//  Copyright © 2018 ws. All rights reserved.
//

import UIKit

import UIKit

class LogCell: UITableViewCell {
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var idLabel: UILabel!
}

class ItemsViewController: UITableViewController {
    var itemStore: ItemStore!
    
    var numberFormatter: NumberFormatter {
        let numberf = NumberFormatter()
        numberf.formatWidth = 4
        numberf.minimumIntegerDigits = 4
        numberf.maximumIntegerDigits = 4
        numberf.allowsFloats = false
        return numberf
    }
    @IBOutlet var newLogButton: UIBarButtonItem!
    var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "MMM d, YYYY 'at' hh:mm:ss at"
        return df
    }
    
    @IBAction func addNewItem(_ sender: UIButton){
        // Create a new log and add it to the store
        let newLog = itemStore.createLog(dateFormatter: dateFormatter, numberFormatter: numberFormatter)
        // Figure out where that log is in the array
        if let index = itemStore.allLogs.index(of: newLog) {
            let indexPath = IndexPath(row: index, section: 0)
            // Insert this new row into the table
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    @IBAction func toggleEditingMode(_ sender: UIButton){
        // If you are currently in editing mode...
        if isEditing {
            // Change text of button to inform user of state
            sender.setTitle("Edit", for: .normal)
            // Turn off editing mode
            setEditing(false, animated: true)
        } else {
            // Change text of button to inform user of state
            sender.setTitle("Done", for: .normal)
            // Enter editing mode
            setEditing(true, animated: true)
        }
    }
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //override func tableView(_ tableView: UITableView,
                            //cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell, with default appearance
        let cell = tableView.dequeueReusableCell(withIdentifier: "LogCell", for: indexPath) as! LogCell
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        //let item = itemStore.allItems[indexPath.row]
        let log = itemStore.allLogs[indexPath.row]

        cell.textLabel?.text = log.id
        cell.detailTextLabel?.text = log.dateCreated
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
            // Remove the item from the store
            itemStore.removeItem(item)
            // Also remove that row from the table view with an animation
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get the height of the status bar
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        
    }
    
    
    
}
