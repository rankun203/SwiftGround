//
//  Restaurant.swift
//  FoodPin
//
//  Created by Kun on 10/17/15.
//  Copyright © 2015 Kun. All rights reserved.
//

public class Restaurant {
    var name: String
    var image: String
    var location: String
    var type: String
    var isVisited: Bool
    
    init (name: String, type: String, location: String, image: String, isVisited: Bool){
        self.name = name
        self.image = image
        self.location = location
        self.type = type
        self.isVisited = isVisited
    }
    
}