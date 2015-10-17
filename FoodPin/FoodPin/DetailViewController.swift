//
//  DetailViewController.swift
//  FoodPin
//
//  Created by Kun on 10/17/15.
//  Copyright © 2015 Kun. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var restaurantNameView: UILabel!
    @IBOutlet weak var restaurantTypeView: UILabel!
    @IBOutlet weak var restaurantLocationView: UILabel!
    @IBOutlet weak var restaurantBeenHereView: UILabel!
    
    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        restaurantImageView.image = UIImage(named: restaurant.image)
        restaurantNameView.text = restaurant.name
        restaurantTypeView.text = restaurant.type
        restaurantLocationView.text = restaurant.location
        restaurantBeenHereView.text = restaurant.isVisited ? "Yes" : "No"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
