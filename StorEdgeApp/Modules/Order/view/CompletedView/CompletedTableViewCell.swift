//
//  CompletedTableViewCell.swift
//  StorEdgeApp
//
//  Created by admin on 31/07/23.
//

import UIKit

class CompletedTableViewCell: UITableViewCell {

    @IBOutlet weak var completedLAbel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
