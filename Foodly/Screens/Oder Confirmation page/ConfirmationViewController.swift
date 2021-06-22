//
//  ConfirmationViewController.swift
//  Foodly
//
//  Created by Decagon on 14.6.21.
//

import UIKit

class ConfirmationViewController: UIViewController {
    
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var checkMarkView: UIView!
    @IBOutlet weak var purpleDotView: UIView!
    @IBOutlet weak var phoneImageView: UIView!
    @IBOutlet weak var checkMarkView2: UIView!
    @IBOutlet weak var deliveryPersonImageView: UIView!
    @IBOutlet weak var confirmationDetailsView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {

        self.navigationController!.popToRootViewController(animated: true)
    }
    
    func setUpView() {
        confirmationDetailsView.layer.cornerRadius = 23
        phoneImageView.layer.cornerRadius = 14
        deliveryPersonImageView.layer.cornerRadius = 14
        checkMarkView.layer.cornerRadius = 10
        checkMarkView2.layer.cornerRadius = 10
        purpleDotView.layer.cornerRadius = 10
        doneButton.layer.cornerRadius = 20

    }
}
