//
//  SplashCoordinator.swift
//  StorEdgeApp
//
//  Created by admin on 03/08/23.
//

import Foundation
import UIKit

protocol SplashVCFlow : AnyObject {
    func coordinateToDashboardVC()
    func coordinateToExploreVC()
}

class SplashCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
      
    }

    func start() {
        let splashVC =  SplashViewController.instantiate()
        splashVC.coordinator = self
        self.navigationController.setViewControllers([splashVC], animated: true)
//        self.navigationController.pushViewController(dashboardVC, animated: true)
    }
}

extension SplashCoordinator: SplashVCFlow {
    
    func coordinateToDashboardVC() {
        let dashboardCoordinator = DashboardCoordinator(navigationController: navigationController)
        coordinate(to:dashboardCoordinator)
    }
    
    func coordinateToExploreVC() {
        let exploreCoordinator=ExploreCoordinator(navigationController: navigationController)
        coordinate(to: exploreCoordinator)
    }

}
