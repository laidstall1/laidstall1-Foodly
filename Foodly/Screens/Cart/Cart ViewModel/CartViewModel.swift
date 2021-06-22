//
//  CartViewModel.swift
//  Foodly
//
//  Created by Decagon on 16/06/2021.
//

import UIKit

class CartViewModel {
    var cartItems = [CartModel]()
    var cartTitles = [String]()
    var cartPrice = [Float]()
    var cartImage = [UIImage]()
    var cartNumber = [Int]()
    
    func totalItems() -> [CartModel] {
        for itemAtRow in 0 ..< cartTitles.count {
            cartItems.append(CartModel(itemName: cartTitles[itemAtRow], itemPrice: cartPrice[itemAtRow], itemImage: cartImage[itemAtRow]))
        }
        return cartItems
    }
    
    init() {
        self.cartItems = totalItems()
    }
}
