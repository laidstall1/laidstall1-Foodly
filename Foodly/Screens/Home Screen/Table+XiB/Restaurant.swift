//
//  Restaurant.swift
//  Foodly
//
//  Created by Decagon on 09/06/2021.
//

import UIKit

struct Restaurants {
    let restaurantName: String
    let restaurantImage: UIImage
    let category: String
    let timeLabel: String
    let discountLabel: String
}

let restaurant: [Restaurants] = [
    Restaurants(restaurantName: "Conrad Food",
                restaurantImage: UIImage(imageLiteralResourceName: "Group 43"),
                category: "Pizza", timeLabel: "15 min", discountLabel: "50% OFF"),
    Restaurants(restaurantName: "SK Restro",
                restaurantImage: UIImage.init(imageLiteralResourceName: "Group 44"),
                category: "Chinese", timeLabel: "30 min", discountLabel: "40% OFF"),
    Restaurants(restaurantName: "Black Fish",
                restaurantImage: UIImage(imageLiteralResourceName: "Group 45"),
                category: "Seafood", timeLabel: "20 min",
                discountLabel: "40% OFF"),
    Restaurants(restaurantName: "Goichiko Onoiko",
restaurantImage: UIImage(imageLiteralResourceName: "Group 46"),
                                                                                                   
category: "Fast Food", timeLabel: "20 min", discountLabel: "50% OFF"), Restaurants(restaurantName: "Conrad Food",
   restaurantImage: UIImage(imageLiteralResourceName: "Group 43"),
   category: "Pizza",
   timeLabel: "15 min", discountLabel: "50% OFF"),
    
    Restaurants(restaurantName: "Conrad Food",
                restaurantImage: UIImage(imageLiteralResourceName: "Group 43"),
                category: "Pizza",
                timeLabel: "15 min",
                discountLabel: "50% OFF"),
    Restaurants(restaurantName: "Conrad Food",
                restaurantImage: UIImage(imageLiteralResourceName: "Group 43"),
                                                                                                 
category: "Pizza", timeLabel: "15 min",
discountLabel: "50% OFF"),
    Restaurants(restaurantName: "Conrad Food",
                restaurantImage: UIImage(imageLiteralResourceName: "Group 43"),
category: "Pizza", timeLabel: "15 min", discountLabel: "50% OFF")
    
]


var filterByCategories = restaurant
