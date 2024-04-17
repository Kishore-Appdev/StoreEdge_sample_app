//
//  WelcomeCoordinator.swift
//  StorEdgeApp
//
//  Created by admin on 03/08/23.
//


import Foundation
import UIKit

protocol WelcomeVCFlow : AnyObject {
    func coordinateToDashboardVC()
    func coordinateToSignInVC()
   
}

class WelcomeCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
      
    }

    func start() {
        let welcomeVC =  WelcomeViewController.instantiate()
        welcomeVC.coordinator = self
        self.navigationController.setViewControllers([welcomeVC], animated: true)
//        self.navigationController.pushViewController(dashboardVC, animated: true)
    }
}

extension WelcomeCoordinator: WelcomeVCFlow {
    func coordinateToSignInVC() {
        let signInCoordinator=SignInCoordinator(navigationController: navigationController)
        coordinate(to: signInCoordinator)
    }
    
    
    func coordinateToDashboardVC() {
        let dashboardCoordinator = DashboardCoordinator(navigationController: navigationController)
        coordinate(to:dashboardCoordinator)
    }

}
