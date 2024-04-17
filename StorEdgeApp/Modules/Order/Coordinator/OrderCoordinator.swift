//
//  OrderCoordinator.swift
//  StorEdgeApp
//
//  Created by admin on 25/07/23.
//

import Foundation
import UIKit
protocol OrderVCFlow{
    func coordinateToMenuVC()
    
}
class OrderCoordinator:Coordinator{
    var navigationController:UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let orderVC=OrderViewController.instantiate()
        orderVC.coordinator=self
        navigationController.setViewControllers([orderVC], animated: true)
    }
    
    
}
extension OrderCoordinator:OrderVCFlow{
    func coordinateToMenuVC() {
        let menuCoordinator = MenuCoordinator(navigationController: navigationController)
        coordinate(to:menuCoordinator)
    }
}
