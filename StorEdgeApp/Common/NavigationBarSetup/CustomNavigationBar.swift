//
//  CustomNavigationBar.swift
//  StorEdgeApp
//
//  Created by admin on 24/07/23.
//

import UIKit

class CustomNavigationBar: UINavigationBar{

    var coordinator:DashboardVCFlow?
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setupNavigationBar()
        
    }
    private func setupNavigationBar()
    {
        // Create a custom UIBarButtonItem for the menu list button
    
        let nav=UINavigationItem().rightBarButtonItems=[UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(menuButtonTapped))]
        
    }
    @objc func menuButtonTapped() {
        coordinator?.coordinateToMenuVC()
        
    } }
