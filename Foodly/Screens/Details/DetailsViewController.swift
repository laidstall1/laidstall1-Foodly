//
//  DetailsViewController.swift
//  Foodly
//
//  Created by mac on 09/06/2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var titleArray: [String] = []
    var amountArray: [Float] = []
    var imageArray: [UIImage] = []
    
    let viewModel = ViewModel()
    
    @IBOutlet weak var numberOfItems: UILabel!
    @IBOutlet weak var viewCartButton: UIButton!
    @IBOutlet weak var totalAmount: UILabel!
    
    @IBOutlet weak var cartView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(DetailsTableViewCell.nib(), forCellReuseIdentifier: DetailsTableViewCell.identifier)
        tableView.register(ImageTableViewCell.nib(), forCellReuseIdentifier: ImageTableViewCell.identifier)
        tableView.register(MenuTableViewCell.nib(), forCellReuseIdentifier: MenuTableViewCell.identifier)
        cartView.isHidden = true
        title = viewModel.restaurantDetail[0].title
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func viewCartButton(_ sender: UIButton) {
        let newStoryboard = UIStoryboard(name: "cart", bundle: nil)
        let newController = newStoryboard
            .instantiateViewController(identifier: "CartsViewController") as CartsViewController
        newController.viewModel.cartTitles = titleArray
        newController.viewModel.cartPrice = amountArray
        newController.viewModel.cartImage = imageArray
        newController.title = "Cart"
        navigationController?.pushViewController(newController, animated: true)
        newController.modalTransitionStyle = .crossDissolve
        newController.modalPresentationStyle = .fullScreen
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? CartsViewController {
            controller.viewModel.cartTitles = titleArray
            controller.viewModel.cartPrice = amountArray
            controller.viewModel.cartImage = imageArray
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "CartsViewController" {
            if titleArray.count < 1 {
                return false
            }
        }
        return true
    }
    
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.restaurantDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier:
                                                            ImageTableViewCell.identifier, for: indexPath)
                    as? ImageTableViewCell else {fatalError()}
            
            if !cell.isHidden {
                title = viewModel.restaurantDetail[0].title
            } else if cell.isHidden {
                title = viewModel.restaurantDetail[1].title
            }
            cell.configure(with: viewModel.restaurantDetail[indexPath.row])
            return cell
        } else if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier:
                                                            MenuTableViewCell.identifier, for: indexPath)
                    as? MenuTableViewCell else {fatalError()}
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier:
                                                            DetailsTableViewCell.identifier, for: indexPath)
                    as? DetailsTableViewCell else {fatalError()}
            
            cell.configure(with: viewModel.restaurantDetail[indexPath.row])
            cell.delegate = self
            return cell
            
        }
    }
    
}

extension DetailsViewController: DetailsTableViewCellDelegate {
    
    func didTapAddBtn(with title: String, and amount: String, and titleImage: UIImage) {
        cartView.isHidden = false
        self.titleArray.append(title)
        self.amountArray.append(Float("\(amount.suffix(amount.count - 1))") ?? 0)
        self.imageArray.append(titleImage)
        if titleArray.count == 1 {
            numberOfItems.text = String("\(titleArray.count) item")
        } else {
            numberOfItems.text = String("\(titleArray.count) items")
        }
        totalAmount.text = "$\(amountArray.reduce(0, +))"
        
    }
    
    func didTapRemoveBtn(with title: String, and amount: String, and titleImage: UIImage) {
        self.titleArray.remove(at: titleArray.firstIndex(of: title)!)
        self.amountArray.remove(at: amountArray.firstIndex(of: Float("\(amount.suffix(amount.count - 1))")!)!)
        self.imageArray.remove(at: imageArray.firstIndex(of: titleImage)!)
        if titleArray.count == 0 {
            cartView.isHidden = true
        } else if titleArray.count == 1 {
            numberOfItems.text = String("\(titleArray.count) item")
        } else {
            numberOfItems.text = String("\(titleArray.count) items")
        }
        totalAmount.text = "$\(amountArray.reduce(0, +))"
    }
    
}
