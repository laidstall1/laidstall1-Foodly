//
//  CartsTableViewController.swift
//  Foodly
//
//  Created by Decagon on 16/06/2021.
//

import UIKit

class CartsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var deliveryUIView: UIView!
    @IBOutlet weak var promoUIView: UIView!
    @IBOutlet weak var continueUiView: UIButton!
    @IBOutlet weak var promoCodeTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    let viewModel = CartViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CartTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CartTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        promoCodeTextField.borderStyle = .none
        viewModel.cartItems = viewModel.totalItems()
        roundedCorners()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    }
    
    func addPrice() {
        
    }
    
    func roundedCorners() {
        deliveryUIView.layer.cornerRadius = 18
        promoUIView.layer.cornerRadius = 18
        continueUiView.layer.cornerRadius = 18
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cartItems.count
    }
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        
        let newStoryboard = UIStoryboard(name: "Confirmation", bundle: nil)
        let newController = newStoryboard
            .instantiateViewController(identifier: "ConfirmationViewController") as ConfirmationViewController
        newController.title = "Confirmation"
        navigationController?.pushViewController(newController, animated: true)
        newController.modalTransitionStyle = .crossDissolve
        newController.modalPresentationStyle = .fullScreen
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
                .dequeueReusableCell(withIdentifier: "CartTableViewCell") as? CartTableViewCell else {
            return UITableViewCell()}
        cell.configureCart(with: viewModel.cartItems[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
