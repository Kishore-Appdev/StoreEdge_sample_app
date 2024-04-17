//
//  Storyboard.swift
//  StorEdgeApp
//
//  Created by admin on 24/07/23.
//


import Foundation
import UIKit

protocol Storyboard {
    static var storyboard: AppStoryboard { get }
    static func instantiate() -> Self
}

extension Storyboard {
    static func instantiate() -> Self {
        let identifier = String(describing: self)
        let uiStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let viewController = uiStoryboard.instantiateViewController(withIdentifier: identifier) as! Self

        return viewController
    }
}

//Enum for use the storyboard
enum AppStoryboard: String {
    case splash="Splash"
    case exploreUs="ExploreUs"
    case welcome="Welcome"
    case stockSimplified="StockSimplified"
    case signIn="SignIn"
    case dashboard = "Dashboard"
    case menu = "Menu"
    case help="Help"
    case order="Order"
    case products="Products"
    case deliveryPartners="Delivery"
    case customers="Customers"
    case customersView="ViewCustomer"
}
