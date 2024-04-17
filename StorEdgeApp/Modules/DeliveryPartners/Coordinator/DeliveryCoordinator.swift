//
//  DeliveryPartnersCoordinator.swift
//  StorEdgeApp
//
//  Created by admin on 26/07/23.
//

import Foundation
import UIKit
protocol DeliveryVCFlow{
    func coordinateToMenuVC()
    
}
class DeliveryCoordinator:Coordinator{
    var navigationController:UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let deliveryVC=DeliveryViewController.instantiate()
        deliveryVC.coordinator=self
        navigationController.setViewControllers([deliveryVC], animated: true)
    }
    
    
}
extension DeliveryCoordinator:DeliveryVCFlow{
    func coordinateToMenuVC() {
        let menuCoordinator = MenuCoordinator(navigationController: navigationController)
        coordinate(to:menuCoordinator)
    }
}
