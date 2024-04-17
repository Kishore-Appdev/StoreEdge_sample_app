//
//  ProductCoordinator.swift
//  StorEdgeApp
//
//  Created by admin on 26/07/23.
//

import Foundation
import UIKit
protocol ProductsVCFlow{
    func coordinateToMenuVC()
    
}
class ProductsCoordinator:Coordinator{
    var navigationController:UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let productVC=ProductsViewController.instantiate()
        productVC.coordinator=self
        navigationController.setViewControllers([productVC], animated: true)
    }
    
    
}
extension ProductsCoordinator:ProductsVCFlow{
    func coordinateToMenuVC() {
        let menuCoordinator = MenuCoordinator(navigationController: navigationController)
        coordinate(to:menuCoordinator)
    }
}
