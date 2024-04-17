//
//  DashboardViewController.swift
//  StorEdgeApp
//
//  Created by admin on 24/07/23.
//

import UIKit

class DashboardViewController: UIViewController,Storyboard{
    
    static var storyboard = AppStoryboard.dashboard
    var coordinator:DashboardVCFlow?
   
   
    @IBOutlet weak var topMenuView: UIView!
    @IBOutlet weak var totalStackView: UIStackView!
    @IBOutlet weak var deliveryStackView: UIStackView!
    @IBOutlet weak var orderStackView: UIStackView!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var OrdersLAbel: UILabel!
    @IBOutlet weak var DeliveryLabel: UILabel!
    @IBOutlet weak var productsLabel: UILabel!
    @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var lowStockLAbel: UILabel!
    @IBOutlet weak var averagePrice: UILabel!
    @IBOutlet weak var AverageCost: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let content = UNMutableNotificationContent()
        content.title = "title"
        content.body = "body"
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "testNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
        
        navigationController?.navigationBar.setDarkOrangeAppearance()
        navigationController?.setNavigationBarHidden(true, animated: true)
        orderStackView.addBottomBorderLineWithColor(color: .black, width: 1.0)
        deliveryStackView.addBottomBorderLineWithColor(color: .black, width: 1.0)
        totalStackView.addBottomBorderLineWithColor(color: .black, width: 1.0)
        topMenuView.addBottomBorderLineWithColor(color: .black, width: 1)
        navigationController?.navigationBar.addBottomBorderLineWithColor(color: .black, width: 1)
        
  
    }
   
    @IBAction func menuButtonTapped(_ sender: Any) {
        coordinator?.coordinateToMenuVC()
    }

}
    
//    @IBAction func menuButtonTapped(_ sender: Any) {
//        coordinatorr?.coordinateToMenuVC()
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


