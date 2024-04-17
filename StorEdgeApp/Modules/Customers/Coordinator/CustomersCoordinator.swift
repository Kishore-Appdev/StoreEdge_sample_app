//
//  CustomerCoordinator.swift
//  StorEdgeApp
//
//  Created by admin on 26/07/23.
//

import Foundation
import UIKit
protocol CustomersVCFlow{
    func coordinateToMenuVC()
    func coordinateToViewCustomerVC()
    
}
class CustomersCoordinator:Coordinator{
    var navigationController:UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let productVC=CustomersViewController.instantiate()
        productVC.coordinator=self
        navigationController.setViewControllers([productVC], animated: true)
    }
    
    
}
extension CustomersCoordinator:CustomersVCFlow{
    func coordinateToViewCustomerVC() {
        let viewCustomerCoordinator=ViewCustomerCoordinator(navigationController:navigationController)
    coordinate(to: viewCustomerCoordinator)
    }
    
    func coordinateToMenuVC() {
        let menuCoordinator = MenuCoordinator(navigationController: navigationController)
        coordinate(to:menuCoordinator)
    }
}
