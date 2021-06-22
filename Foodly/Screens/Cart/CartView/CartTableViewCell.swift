//
//  CartTableViewCell.swift
//  Foodly
//
//  Created by Decagon on 16/06/2021.
//

import UIKit

protocol CartTableViewCellDelegate: AnyObject {
    func addBtnTapped(with name: String, and amount: Float, and quantity: Int)
    func minusBtnTapped(with name: String, and amount: Float, and quantity: Int)
}

class CartTableViewCell: UITableViewCell {
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    
//    private var currentQty = 1.0
//    private var cureArr = [Double]()
    weak var delegate: CartTableViewCellDelegate?
    
    var tableViewModel = CartViewModel()
    var oldAmount = [Float]()
    
    public func configureCart(with model: CartModel) {
        restaurantImage.image = model.itemImage
        nameLabel.text = model.itemName
        priceLabel.text = "$\(model.itemPrice)"
        restaurantImage.image = model.itemImage
    }
    
    @IBAction func toAddItem(_ sender: Any) {
        let quantity = Float(itemCountLabel.text!)! + 1
        oldAmount.append(Float((priceLabel.text?.suffix(priceLabel.text!.count - 1))!)!)
        itemCountLabel.text = String(Int(itemCountLabel.text!)! + 1)
        delegate?.minusBtnTapped(with: nameLabel.text!, and: Float(priceLabel.text!)!, and: Int(itemCountLabel.text!)!)
        priceLabel.text = "$\( quantity * oldAmount[0])"
        tableViewModel.cartItems = tableViewModel.totalItems()
        print(tableViewModel.cartItems)
        print(quantity)
    }
    
    @IBAction func toMinusItem(_ sender: Any) {
        let quantity = Float(itemCountLabel.text!)! - 1
        oldAmount.append(Float((priceLabel.text?.suffix(priceLabel.text!.count - 1))!)!)
        if quantity <= 1 {
            itemCountLabel.text = "1"
            priceLabel.text = "$\( 1 * oldAmount[0])"
        } else {
            itemCountLabel.text = String(Int(itemCountLabel.text!)! - 1)
            delegate?.minusBtnTapped(with: nameLabel.text!,
                                     and: Float(priceLabel.text!)!, and: Int(itemCountLabel.text!)!)
            priceLabel.text = "$\( quantity * oldAmount[0])"
//            print(tableViewModel.amount)
        }
    }
}
