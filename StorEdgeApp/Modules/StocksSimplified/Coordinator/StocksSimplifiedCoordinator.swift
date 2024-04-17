//
//  StocksSimplifiedCoordinator.swift
//  StorEdgeApp
//
//  Created by admin on 04/08/23.
//

import Foundation
import UIKit

protocol StocksSimplifiedVCFlow: AnyObject {
    func coordinateToDashboardVC()
    func coordinateToWelcomeVC()
}

class StocksSimplifiedCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
      
    }

    func start() {
        let stocksSimplifiedVC =  StockSimplifiedViewController.instantiate()
        stocksSimplifiedVC.coordinator = self
        self.navigationController.setViewControllers([stocksSimplifiedVC], animated: true)
//        self.navigationController.pushViewController(dashboardVC, animated: true)
    }
}

extension StocksSimplifiedCoordinator: StocksSimplifiedVCFlow {
    func coordinateToWelcomeVC() {
        let welcomeCoordinator=WelcomeCoordinator(navigationController: navigationController)
        coordinate(to: welcomeCoordinator)
     
    }
    

    
    
    func coordinateToDashboardVC() {
        let dashboardCoordinator = DashboardCoordinator(navigationController: navigationController)
        coordinate(to:dashboardCoordinator)
    }

}
