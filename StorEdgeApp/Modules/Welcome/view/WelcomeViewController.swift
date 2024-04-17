//
//  WelcomeViewController.swift
//  StorEdgeApp
//
//  Created by admin on 03/08/23.
//

import UIKit

class WelcomeViewController: UIViewController,Storyboard {
    static var storyboard=AppStoryboard.welcome
    var coordinator:WelcomeVCFlow?
    
    @IBOutlet weak var welcomePerson: UIImageView!
    @IBOutlet weak var welcomeLogo: UIImageView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var kfImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        // Do any additional setup after loading the view.
    }
    
    func configureUI(){
        registerButton.applyRoundedCorners(radius: registerButton.bounds.height/2)
        signInButton.applyRoundedCorners(radius: signInButton.bounds.height/2)
        
    }
    @IBAction func signInButtonTapped(_ sender: Any) {
        coordinator?.coordinateToSignInVC()
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
