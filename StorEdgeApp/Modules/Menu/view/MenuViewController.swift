//
//  MenuViewController.swift
//  StorEdgeApp
//
//  Created by admin on 24/07/23.
//

import UIKit

class MenuViewController: UIViewController,Storyboard{
    static var storyboard = AppStoryboard.menu
    var coordinator:MenuVCFlow?
    var productViewController:ProductsViewController?
    weak var delegate:MenuTableUpdateDelegate?
    @IBOutlet weak var menuExitButton: UIButton!
    @IBOutlet weak var dashBoardButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var orderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        // Do any additional setup after loading the view.
    }
 
    
    
    @IBAction func menuExitButtonTapped(_ sender: Any) {
        coordinator?.coordinateToDashboardVC()
    }
    @IBAction func dashBoardButtonTapped(_ sender: Any) {
        coordinator?.coordinateToDashboardVC()
    }
    
    @IBAction func helpButtonTapped(_ sender: Any) {
        coordinator?.coordinateToHelpVC()
    }
    @IBAction func orderButtonTapped(_ sender: Any) {
        coordinator?.coordinateToOrderVC()
    }
    @IBAction func productsButtonTapped(_ sender: Any) {
        DataBaseHelper().deleteByEntityName(entityName: "ProductEntity")
        coordinator?.coordinateToProductsVC()
    }
    @IBAction func deliveryButtonTapped(_ sender: Any) {
        DataBaseHelper().deleteByEntityName(entityName: "DeliveryPartnerDB")
        coordinator?.coordinateToDeliveryVC()
    }
    @IBAction func customersButtonTapped(_ sender: Any) {
        DataBaseHelper().deleteByEntityName(entityName: "CustomersDb")
        coordinator?.coordinateToCustomersVC()
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
