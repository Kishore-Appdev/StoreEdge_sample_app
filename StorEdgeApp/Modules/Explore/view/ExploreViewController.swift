//
//  ExploreViewController.swift
//  StorEdgeApp
//
//  Created by admin on 03/08/23.
//

import UIKit
protocol ExploreDelegate:AnyObject{
    func exploreVC(_ exploreVc:ExploreViewController)
}

class ExploreViewController: UIViewController,Storyboard{

    
    static var shared=ExploreViewController()
    static var storyboard=AppStoryboard.exploreUs
    var coordinator:ExploreVCFlow?
    weak var delegate:ExploreDelegate?
    @IBOutlet weak var exploreButton: UIButton!
//    var stocksVC=StockSimplifiedViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        exploreButton.layer.cornerRadius=exploreButton.bounds.height/2
        exploreButton.clipsToBounds=true
//        self.delegate=self
        delegate?.exploreVC(self)
        // Do any additional setup after loading the view.
    }
    
    func nextButtonTapped(_ stocksVC: StockSimplifiedViewController) {
        coordinator?.coordinateToWelcomeVC()
    }
    @IBAction func exploreButtonTapped(_ sender: Any) {
//        let storyboard=UIStoryboard(name: "StockSimplified", bundle: nil)
//        let stockSimplifiedVC=storyboard.instantiateViewController(withIdentifier: "StockSimplifiedViewController") as! StockSimplifiedViewController
//        stockSimplifiedVC.view.frame=self.view.bounds
//        addChild(stockSimplifiedVC)
//        view.addSubview(stockSimplifiedVC.view)
//        stockSimplifiedVC.didMove(toParent: self)
        coordinator?.coordinateToStocksSimplifiedCoordinatorVC()
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
