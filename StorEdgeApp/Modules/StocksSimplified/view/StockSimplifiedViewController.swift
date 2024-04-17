//
//  StockSimplifiedViewController.swift
//  StorEdgeApp
//
//  Created by admin on 03/08/23.
//

import UIKit

class StockSimplifiedViewController: UIViewController,Storyboard{

    var coordinator:StocksSimplifiedVCFlow?
    static var storyboard=AppStoryboard.stockSimplified
   
  
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius=nextButton.bounds.height/2
        nextButton.clipsToBounds=true
   
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        self.coordinator?.coordinateToWelcomeVC()
//        delegate?.nextButtonTapped(self)
//        let welcomeCoordiantor=WelcomeCoordinator(navigationController: navigationController)
//        welcomeCoordiantor.start()

        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
