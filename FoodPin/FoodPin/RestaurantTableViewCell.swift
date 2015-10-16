//
//  RestaurantTableViewCell.swift
//  FoodPin
//
//  Created by Kun on 10/16/15.
//  Copyright © 2015 Kun. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellName: UILabel!
    @IBOutlet weak var cellLocation: UILabel!
    @IBOutlet weak var cellType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
