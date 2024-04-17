//
//  MenuCoordinator.swift
//  StorEdgeApp
//
//  Created by admin on 24/07/23.
//

import Foundation
import UIKit

protocol MenuVCFlow:AnyObject{
    func coordinateToDashboardVC()->DashboardCoordinator
    func coordinateToHelpVC()->HelpCoordinator
    func coordinateToOrderVC()->OrderCoordinator
    func coordinateToProductsVC()->ProductsCoordinator
    func coordinateToDeliveryVC()->DeliveryCoordinator
    func coordinateToCustomersVC()->CustomersCoordinator
}

class MenuCoordinator:Coordinator{
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let menuVC =  MenuViewController.instantiate()
        menuVC.coordinator = self
        self.navigationController.setViewControllers([menuVC], animated: true)
    }
    
}
extension MenuCoordinator:MenuVCFlow{
   
    func coordinateToDashboardVC() -> DashboardCoordinator {
        let dashboardCoordinator=DashboardCoordinator(navigationController: navigationController)
        coordinate(to: dashboardCoordinator)
        return dashboardCoordinator
    }
    func coordinateToHelpVC() -> HelpCoordinator {
        let helpCoordinator=HelpCoordinator(navigationController: navigationController)
        coordinate(to: helpCoordinator)
        return helpCoordinator
    }
    func coordinateToOrderVC() -> OrderCoordinator {
        let orderCoordinator=OrderCoordinator(navigationController: navigationController)
        coordinate(to: orderCoordinator)
        return orderCoordinator
    }
    func coordinateToProductsVC() -> ProductsCoordinator {
        let productsCoordinator=ProductsCoordinator(navigationController: navigationController)
        coordinate(to: productsCoordinator)
        return productsCoordinator
    }
    
    func coordinateToDeliveryVC() -> DeliveryCoordinator {
        let deliveryCoordinator=DeliveryCoordinator(navigationController: navigationController)
        coordinate(to: deliveryCoordinator)
        return deliveryCoordinator
    }
    
    func coordinateToCustomersVC() -> CustomersCoordinator {
        let customersCoordinator=CustomersCoordinator(navigationController: navigationController)
        coordinate(to: customersCoordinator)
        return customersCoordinator
    }
    
   
    
  
    
}
