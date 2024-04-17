//
//  DeliveryPartnerTableViewCell.swift
//  StorEdgeApp
//
//  Created by admin on 31/07/23.
//

import UIKit
protocol DeliveryCellDelegate{
   
}
class DeliveryPartnerTableViewCell: UITableViewCell {

    @IBOutlet weak var deliveryPartnerImage: UIImageView!
    @IBOutlet weak var noOfDeliveryLabel: UILabel!
    @IBOutlet weak var nameLAbe: UILabel!
    @IBOutlet weak var iDLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var noOfRatingsProvidedlabel: UILabel!
    @IBOutlet weak var deliveryPartnerStatusButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        deliveryPartnerStatusButton.layer.cornerRadius=deliveryPartnerStatusButton.bounds.height/4
        deliveryPartnerStatusButton.clipsToBounds=true
        // Configure the view for the selected state
    }
    
}
