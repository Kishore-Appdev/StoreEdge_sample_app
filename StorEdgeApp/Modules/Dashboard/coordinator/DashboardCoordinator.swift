//
//  DashboardCoordinator.swift
//  StorEdgeApp
//
//  Created by admin on 24/07/23.
//


import Foundation
import UIKit

protocol DashboardVCFlow : AnyObject {
    func coordinateToMenuVC()
}

class DashboardCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
      
    }

    func start() {
        let dashboardVC =  DashboardViewController.instantiate()
        dashboardVC.coordinator = self
        self.navigationController.setViewControllers([dashboardVC], animated: true)
//        self.navigationController.pushViewController(dashboardVC, animated: true)
    }
}

extension DashboardCoordinator: DashboardVCFlow {
    
    func coordinateToMenuVC() {
        let menuCoordinator = MenuCoordinator(navigationController: navigationController)
        coordinate(to:menuCoordinator)
    }

}
