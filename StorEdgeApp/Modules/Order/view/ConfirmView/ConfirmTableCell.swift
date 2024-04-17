//
//  ConfirmTableCell.swift
//  StorEdgeApp
//
//  Created by admin on 07/08/23.
//


import UIKit
protocol ConfirmTableViewCellDelegate:AnyObject{
    func confirmButtonTapped(for cell:ConfirmTableCell)
}
class ConfirmTableCell: UITableViewCell {

    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var actionDescriptionLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDescLabel: UILabel!
    @IBOutlet weak var quantityOfProductLabel: UILabel!
    @IBOutlet weak var orderTotal: UILabel!


    @IBOutlet weak var actionButtonView: UIView!
    @IBOutlet weak var customerView: UIView!
    @IBOutlet weak var orderTotalView: UIView!
    @IBOutlet weak var viewMoreProductsView: UIView!
    @IBOutlet weak var productStackView: UIView!
    @IBOutlet weak var noOfItemsLabel: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var customerNameLabel: UILabel!
    @IBOutlet weak var customerImage: UIImageView!
    
    weak var delegate:ConfirmTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
//        print("is hidden button=\(prepareButton.isHidden)")
        // Initialization code
//        productStackView.addBottomBorderLineWithColor(color: .gray, width: 0.5)
        customerView.addBottomBorderLineWithColor(color: .gray, width: 0.5)
        productStackView.addBottomBorderLineWithColor(color: .gray, width: 0.5)
        viewMoreProductsView.addBottomBorderLineWithColor(color: .gray, width: 0.5)
        orderTotalView.addBottomBorderLineWithColor(color: .gray, width: 0.5)
        actionButton.layer.cornerRadius=actionButton.bounds.height/4
        actionButton.clipsToBounds=true
    }
    @IBAction func confirmButtonAction(_ sender: Any) {
        delegate?.confirmButtonTapped(for: self)
    }   


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
