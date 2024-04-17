//
//  ViewDeliveryPartnerInfoViewController.swift
//  StorEdgeApp
//
//  Created by admin on 31/07/23.
//

import UIKit

class ViewDeliveryPartnerInfoViewController: UITableViewController,DeliveryVCDelegate {
    var selectedDeliveryPartner:DeliveryPartnerModel!
    func deliveryPartnerCellTapped(_ selectedPartner: DeliveryPartnerModel) {
        self.selectedDeliveryPartner=selectedPartner
        print(self.selectedDeliveryPartner.userName)
    }
    
    @IBOutlet weak var idLAbel: UILabel!
    @IBOutlet weak var userNameLabe: UILabel!
    @IBOutlet weak var firstNameLAbel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var dataOfBirth: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var phNumber: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureData()

    }
    func configureData(){
        idLAbel.text=selectedDeliveryPartner.id
        userNameLabe.text=selectedDeliveryPartner.userName
        firstNameLAbel.text=selectedDeliveryPartner.firstName
        lastNameLabel.text=selectedDeliveryPartner.lastName
        dataOfBirth.text=selectedDeliveryPartner.dob
        genderLabel.text=selectedDeliveryPartner.gender
        phNumber.text=selectedDeliveryPartner.phNO
        emailLabel.text=selectedDeliveryPartner.email
        cityLabel.text=selectedDeliveryPartner.city
        addressLabel.text=selectedDeliveryPartner.address
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
