//
//  HelpCoordinator.swift
//  StorEdgeApp
//
//  Created by admin on 24/07/23.
//

import Foundation
import UIKit

protocol HelpVCFlow{
    func coordinateToMenuVC()
    
}
class HelpCoordinator:Coordinator{
    var navigationController:UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let helpVC=HelpViewController.instantiate()
        helpVC.coordinator=self
        navigationController.setViewControllers([helpVC], animated: true)
        
        
    }
    
    
}
extension HelpCoordinator:HelpVCFlow{
    func coordinateToMenuVC() {
        let menuCoordinator = MenuCoordinator(navigationController: navigationController)
        coordinate(to:menuCoordinator)
    }

}
