//
//  ProductsViewCellTableViewCell.swift
//  StorEdgeApp
//
//  Created by admin on 26/07/23.
//

import UIKit

class ProductsViewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var availableQuantityStackView: UIStackView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var availableQuantityLabel: UILabel!
    @IBOutlet weak var lastUpdateLabel: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        availableQuantityStackView.addBottomBorderLineWithColor(color: .black, width: 1)
//        view.addBottomBorderLineWithColor(color: .black, width: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
