//
//  CustomerTableViewCell.swift
//  StorEdgeApp
//
//  Created by admin on 28/07/23.
//

import UIKit
import Foundation
protocol CustomCellDelegate:AnyObject{
    func customCellButtonTapped(_ cell:CustomerTableViewCell,_ selectedData:CustomerModel)
}
class CustomerTableViewCell: UITableViewCell{
    var custom:CustomersVCFlow?
    weak var delegate:CustomCellDelegate?
    var customerSelected:CustomerModel?
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var contactNO: UILabel!
    private var title:String=""

    @IBOutlet weak var ViewCustomerButton: UIButton!
    
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(_ title:String){
        self.title=title
        ViewCustomerButton.setTitle(title, for: .normal)
    }

    @IBAction func ViewCustomerButtonTapped(_ sender: Any) {
   
      
        delegate?.customCellButtonTapped(self,self.customerSelected ?? CustomerModel(firstName: "", lastName: "", fullName: "", dateOfBirth: "", gender: "", phoneNumber: "", email: "", address: "", customerSince: "", totalNumberOfOrders: "", noOfCancelOrders: 0, prefferedPayment: "", customerImage: "") )
        
    }
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
