//
//  AppCoordinator.swift
//  StorEdgeApp
//
//  Created by admin on 24/07/23.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var window: UIWindow

    init(window: UIWindow) {
        self.window = window
        let nav = UINavigationController().navigationController?.navigationBar
        nav?.barStyle = .black
        nav?.tintColor = .white
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func start() {
        let navigationController = UINavigationController()
        //navigationController.navigationBar.barTintColor = .systemRed //MPThemeProvider.sharedInstance.theme.menuPilot_dark_red
        navigationController.navigationBar.tintColor = .white
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        let splashCoordinator = SplashCoordinator(navigationController: navigationController)
        coordinate(to: splashCoordinator)
    }
}
