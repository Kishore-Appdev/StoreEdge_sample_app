//
//  ViewCustomerInfoViewController.swift
//  StorEdgeApp
//
//  Created by admin on 28/07/23.
//

import UIKit
protocol SelectedCustomer{
    func returnSelCustomer(_ data:CustomerModel)
}
class ViewCustomerInfoViewController: UITableViewController,Storyboard{
    
  
    
    static var storyboard=AppStoryboard.customersView
//    var pro:SelectedCustomer?
    @IBOutlet weak var customerImageView: UIImageView!
    @IBOutlet weak var preffererdPaymentLabel: UILabel!
    @IBOutlet weak var noOfCancelOrderLabel: UILabel!
    @IBOutlet weak var totalNoOfOrdersLabel: UILabel!
    @IBOutlet weak var customerSinceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phNOLabel: UILabel!
    @IBOutlet weak var genderLAbel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
//    @IBOutlet weak var viewCustomerTableView: UITableView!
    @IBOutlet weak var nameLAbel: UILabel!
    var coordinator:CustomersViewVCFlow?
    var customerSelected:CustomerModel!
    var customerViewController:CustomersViewController!
    var delegate:SelectedCustomer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden=false
        navigationController?.navigationBar.tintColor=UIColor.black
//        nameLAbel.text=customerSelected.fullName

        configureDataOnUi()
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
    }
    func configureDataOnUi(){
        preffererdPaymentLabel.text=customerSelected.prefferedPayment
        noOfCancelOrderLabel.text=String(customerSelected.noOfCancelOrders)
        totalNoOfOrdersLabel.text=customerSelected.totalNumberOfOrders
        customerSinceLabel.text=customerSelected.customerSince
        addressLabel.text=customerSelected.address
        emailLabel.text=customerSelected.email
        phNOLabel.text=customerSelected.phoneNumber
        genderLAbel.text=customerSelected.gender
        dobLabel.text=customerSelected.dateOfBirth
        lastNameLabel.text=customerSelected.lastName
        firstNameLabel.text=customerSelected.firstName
        customerImageView.image=UIImage(named: customerSelected.customerImage)
        
    }
}
