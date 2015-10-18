//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Kun on 10/16/15.
//  Copyright © 2015 Kun. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend.jpg", isVisited: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei.jpg", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha.jpg", isVisited: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl.jpg", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster.jpg", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkeerestaurant.jpg", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier.jpg", isVisited: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery.jpg", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haighschocolate.jpg", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palominoespresso.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate.jpg", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif.jpg", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "grahamavenuemeats.jpg", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "wafflewolf.jpg", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves.jpg", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore.jpg", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional.jpg", isVisited: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina.jpg", isVisited: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia.jpg", isVisited: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak.jpg", isVisited: false),
        Restaurant(name: "Thai Cafe", type: "Thai", location: "London", image: "thaicafe.jpg", isVisited: false)
    ]
    
    let cellIdentifier = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = true
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // Tell the TableView how many rows there is
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    // Row generation
    // Call restaurantNames.count times to build rows
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RestaurantTableViewCell
        
        cell.cellImage.image = UIImage(named: restaurants[indexPath.row].image)
        cell.cellName.text = restaurants[indexPath.row].name
        cell.cellLocation.text = restaurants[indexPath.row].location
        cell.cellType.text = restaurants[indexPath.row].type
        cell.accessoryType = restaurants[indexPath.row].isVisited ? .Checkmark : .None

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
        
//        let visited = self.restaurantVisited[indexPath.row] as Bool
//        
//        let callActionHandler = {(action: UIAlertAction) -> Void in
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//            self.presentViewController(alertMessage, animated: true, completion: nil)
//        }
//        
//        let isVisitedAction = {(action: UIAlertAction) -> Void in
//            let cell = tableView.cellForRowAtIndexPath(indexPath)
//            self.restaurantVisited[indexPath.row] = !visited
//            cell?.accessoryType = visited ? .None : .Checkmark
//        }
//
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet)
//
//        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
//        
//        let callAction = UIAlertAction(title: "Call 123-0000-0\(indexPath.row)", style: .Default, handler: callActionHandler)
//        
//        let beenHereText = visited ? "I haven't been here" : "I've been here"
//        let beenHereAction = UIAlertAction(title: beenHereText, style: .Default, handler: isVisitedAction)
//
//        optionMenu.addAction(cancelAction)
//        optionMenu.addAction(callAction)
//        optionMenu.addAction(beenHereAction)
//        
//        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
    
    // Swipe
    // Setting up actions for a single row when Swipe horizontally though it
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {

        let callAction = UITableViewRowAction(style: .Normal, title: "Call     ", handler: {(action: UITableViewRowAction, indexPath: NSIndexPath) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertMessage, animated: true, completion: nil)
            tableView.setEditing(false, animated: true)
        })
        
        let visitAction = UITableViewRowAction(style: .Normal, title: "Visited", handler: {(action: UITableViewRowAction, indexPath: NSIndexPath) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            let visited = self.restaurants[indexPath.row].isVisited as Bool
            self.restaurants[indexPath.row].isVisited = !visited
            cell?.accessoryType = visited ? .None : .Checkmark
            tableView.setEditing(false, animated: true)
        })

        let deleteAction = UITableViewRowAction(style: .Default, title: "Delete", handler: {(action: UITableViewRowAction, indexPath: NSIndexPath) -> Void in
            // Delete the row from the data source
            self.restaurants.removeAtIndex(indexPath.row)
    
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        })
        
        callAction.backgroundColor = UIColor.greenColor()
        
        return [deleteAction, visitAction, callAction]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier! {
        case "jumpToDetailsSegue":
        
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! DetailViewController
                destinationController.restaurant = self.restaurants[indexPath.row]
            }
        default:
            print("default")
        }
            
            
    }

}