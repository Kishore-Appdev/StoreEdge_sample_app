//
//  DeliverTableViewCell.swift
//  StorEdgeApp
//
//  Created by admin on 31/07/23.
//

import UIKit
protocol DeliverCellDelegate:AnyObject{
    func passDeliverCellTapped(_ cell:DeliverTableViewCell)
}
class DeliverTableViewCell: UITableViewCell {
    weak var delegate:DeliverCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var deliverLAbel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func deliverButtonTapped(_ sender: Any) {
        delegate?.passDeliverCellTapped(self)
    }
    
}
