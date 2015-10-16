//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Kun on 10/16/15.
//  Copyright © 2015 Kun. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "Thai Cafe"]
    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg",
        "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg",
        "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg",
        "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg",
        "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York",  "London", "London",
            "London", "London"]
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea",  "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    var restaurantVisited = [Bool](count: 21, repeatedValue: false)
    let cellIdentifier = "cell"
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RestaurantTableViewCell
        
        cell.cellImage.image = UIImage(named: restaurantImages[indexPath.row])
        cell.cellName.text = restaurantNames[indexPath.row]
        cell.cellLocation.text = restaurantLocations[indexPath.row]
        cell.cellType.text = restaurantTypes[indexPath.row]
        cell.accessoryType = restaurantVisited[indexPath.row] ? .Checkmark : .None

        cell.cellImage.layer.cornerRadius = cell.cellImage.frame.size.width / 2
        cell.cellImage.clipsToBounds = true
        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // Selection
    // Called after the user changes the selection.
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("\(indexPath.item) is selected")
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        let visited = self.restaurantVisited[indexPath.row] as Bool
        
        let callActionHandler = {(action: UIAlertAction) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertMessage, animated: true, completion: nil)
        }
        
        let isVisitedAction = {(action: UIAlertAction) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            self.restaurantVisited[indexPath.row] = !visited
            cell?.accessoryType = visited ? .None : .Checkmark
        }

        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet)

        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        let callAction = UIAlertAction(title: "Call 123-0000-0\(indexPath.row)", style: .Default, handler: callActionHandler)
        
        let beenHereText = visited ? "I haven't been here" : "I've been here"
        let beenHereAction = UIAlertAction(title: beenHereText, style: .Default, handler: isVisitedAction)

        optionMenu.addAction(cancelAction)
        optionMenu.addAction(callAction)
        optionMenu.addAction(beenHereAction)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }

}