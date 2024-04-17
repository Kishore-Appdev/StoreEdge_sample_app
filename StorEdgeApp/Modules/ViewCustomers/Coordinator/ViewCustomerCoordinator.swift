//
//  ViewCustomerCoordinator.swift
//  StorEdgeApp
//
//  Created by admin on 28/07/23.
//

import Foundation
import UIKit
protocol CustomersViewVCFlow:AnyObject{
    
}
class ViewCustomerCoordinator:Coordinator {

    var navigationController:UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let ViewCustomerVC=ViewCustomerInfoViewController.instantiate()
        ViewCustomerVC.coordinator=self
        navigationController.setViewControllers([ViewCustomerVC], animated: true)
    }
    
    
}
extension ViewCustomerCoordinator:CustomersViewVCFlow{
    
}


