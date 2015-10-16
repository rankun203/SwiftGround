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
        
        cell.cellName.layer.shadowColor = UIColor.blackColor().CGColor
        cell.cellName.layer.shadowOffset = CGSize(width: 1, height: 1)
        cell.cellName.layer.shadowRadius = CGFloat(2)
        cell.cellName.layer.shadowOpacity = 0.5
        cell.cellName.clipsToBounds = true

        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}