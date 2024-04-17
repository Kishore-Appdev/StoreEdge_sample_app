//
//  Coordinator.swift
//  StorEdgeApp
//
//  Created by admin on 24/07/23.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator:Coordinator) {
        coordinator.start()
    }
}
