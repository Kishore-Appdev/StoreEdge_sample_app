//
//  ExploreCoordinator.swift
//  StorEdgeApp
//
//  Created by admin on 03/08/23.
//


import Foundation
import UIKit

protocol ExploreVCFlow : AnyObject {
    func coordinateToStocksSimplifiedCoordinatorVC()
    func coordinateToWelcomeVC()
   
}

class ExploreCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
      
    }

    func start() {
        let exploreVC =  ExploreViewController.instantiate()
        exploreVC.coordinator = self
        self.navigationController.setViewControllers([exploreVC], animated: true)
//        self.navigationController.pushViewController(dashboardVC, animated: true)
    }
}

extension ExploreCoordinator: ExploreVCFlow {
    func coordinateToStocksSimplifiedCoordinatorVC() {
        let stocksSimplifiedCoordinator=StocksSimplifiedCoordinator(navigationController: navigationController)
        coordinate(to: stocksSimplifiedCoordinator)
    }
    
    func coordinateToWelcomeVC() {
        let welcomeCoordiantor=WelcomeCoordinator(navigationController: navigationController)
        coordinate(to: welcomeCoordiantor)
    }
    

}
