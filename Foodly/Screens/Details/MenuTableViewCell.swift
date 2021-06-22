//
//  MenuTableViewCell.swift
//  Foodly
//
//  Created by mac on 10/06/2021.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var searchBtn: UIButton!
    
    static let identifier = String(describing: MenuTableViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: MenuTableViewCell.identifier, bundle: nil)
    }
    
    public func configure(with model: DetailModel) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
