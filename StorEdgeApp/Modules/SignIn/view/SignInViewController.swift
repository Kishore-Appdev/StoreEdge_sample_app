//
//  SignInViewController.swift
//  StorEdgeApp
//
//  Created by admin on 03/08/23.
//

import UIKit

class SignInViewController: UIViewController,Storyboard,UITextFieldDelegate {
    static var storyboard=AppStoryboard.signIn
    var coordinator:SignInVCFlow?

    @IBOutlet weak var signInView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate=self
        passwordTextField.delegate=self
        signInButton.layer.cornerRadius=16
        emailTextField.layer.cornerRadius=16
        passwordTextField.layer.cornerRadius=16
        signInView.layer.cornerRadius=16
        self.hideKeyboardTappedAround()
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField:UITextField) ->Bool{
        self.view.endEditing(true)
        return true
    }
    
    func showAlert(_ alertMessage:String){
        let alertController=UIAlertController(title:"Alert Title", message: alertMessage, preferredStyle: .alert)
        let okAction=UIAlertAction(title:"OK" , style: .default) {
            (_) in
            print("ok clicked")
        }
        alertController.addAction(okAction)
        
        present(alertController,animated: true, completion: nil)
    }
    
    
    @IBAction func signInButtonTapped(_ sender: Any) {
//        coordinator?.coordinateToDashboardVC()

//        if let email=emailTextField.text, let password=passwordTextField.text{
//            if email=="" && password==""{
//                showAlert("Please Add detail")
//            }
//
//            else if !email.validateEmailId(){
//                showAlert("Email address not found")
//            }
//            else if !password.validatePassword(){
//                showAlert("Please enter vallid Password")
//            }
//            else if(email=="test@gmail.com" && password=="test@123"){
                coordinator?.coordinateToDashboardVC()
//            }
//        }
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

extension UIViewController{
    func hideKeyboardTappedAround(){
        let tap:UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismisskeyboard))
        tap.cancelsTouchesInView=false
        view.addGestureRecognizer(tap)
    }
    @objc func dismisskeyboard(){
        view.endEditing(true)
    }
}
