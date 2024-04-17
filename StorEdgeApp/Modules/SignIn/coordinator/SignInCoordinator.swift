//
//  SignInCoordinator.swift
//  StorEdgeApp
//
//  Created by admin on 04/08/23.
//
import Foundation
import UIKit

protocol SignInVCFlow: AnyObject {
    func coordinateToDashboardVC()
}

class SignInCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
      
    }

    func start() {
        let signInVC =  SignInViewController.instantiate()
        signInVC.coordinator = self
        self.navigationController.setViewControllers([signInVC], animated: true)
//        self.navigationController.pushViewController(dashboardVC, animated: true)
    }
}

extension SignInCoordinator: SignInVCFlow {
    
    func coordinateToDashboardVC() {
        let dashboardCoordinator = DashboardCoordinator(navigationController: navigationController)
        coordinate(to:dashboardCoordinator)
    }

}
