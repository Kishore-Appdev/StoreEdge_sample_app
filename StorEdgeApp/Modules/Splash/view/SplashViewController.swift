//
//  SplashViewController.swift
//  StorEdgeApp
//
//  Created by admin on 03/08/23.
//

import UIKit

class SplashViewController: UIViewController,Storyboard {
    static var storyboard = AppStoryboard.splash
    var coordinator:SplashVCFlow?
    override func viewDidLoad() {
        super.viewDidLoad()
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 10, execute: nil)
        // Add a timer to dismiss the splash screen after 30 seconds
        Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(coordinateToDashboard), userInfo: nil, repeats: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Make the status bar hidden during the splash screen display
        UIApplication.shared.isStatusBarHidden = true
        
    }
    @objc func coordinateToDashboard() {
        // Dismiss the splash screen and show the main view (e.g., HomeViewController)
        dismiss(animated: true, completion: nil)
        // Make the status bar visible again after dismissing the splash screen
        UIApplication.shared.isStatusBarHidden = false
        
        coordinator?.coordinateToExploreVC()
        
    }
    
}
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    

