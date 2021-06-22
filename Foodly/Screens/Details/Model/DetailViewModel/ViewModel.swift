//
//  ViewModel.swift
//  Foodly
//
//  Created by mac on 10/06/2021.
//

import Foundation

class ViewModel {
    
    var restaurantDetail: [DetailModel] = [
        
        DetailModel(title: "Conrad food", type: "Pizza • Fastfood", image: "ConradFood", amount: nil),
        DetailModel(title: "", type: "", image: "", amount: nil),
        DetailModel(title: "Margherita", type: "In Veg Pizza", image: "Margherita", amount: "$12.50"),
        DetailModel(title: "Veg Loaded", type: "In Pizza Mania", image: "VegLoaded", amount: "$8.50"),
        DetailModel(title: "Farm House", type: "In Pizza Mania", image: "FarmHouse", amount: "$8.50"),
        DetailModel(title: "Fresh Veggie", type: "In Pizza Mania", image: "FreshVeggie", amount: "$11.99"),
        DetailModel(title: "Veg Loaded", type: "In Pizza Mania", image: "VegLoaded", amount: "$8.50")
    ]
}
