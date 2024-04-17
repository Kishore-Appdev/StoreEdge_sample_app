//
//  HelpViewController.swift
//  StorEdgeApp
//
//  Created by admin on 24/07/23.
//

import UIKit
import MessageUI

class HelpViewController: UIViewController,MFMailComposeViewControllerDelegate,Storyboard{
    static var storyboard=AppStoryboard.help
    var coordinator:HelpVCFlow?
    
    

    @IBOutlet weak var helpButtton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      navigationBarSetup()
        // Do any additional setup after loading the view.
    }
    
    func navigationBarSetup(){
       navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(menuListButtonTapped))]
        navigationItem.leftBarButtonItem=UIBarButtonItem(title: "Help", style: .done, target: self, action: nil)
       navigationController?.setNavigationBarHidden(false, animated: true)
       }
   @objc func menuListButtonTapped(){
       coordinator?.coordinateToMenuVC()
   }
    @IBAction func helpButtonTapped(_ sender: Any) {
        let recipient="bkishore269@gmail.com"
        if let url=URL(string:"https://mailto:\(recipient)"){
            let a=UIApplication.shared.open(url,options: [:],completionHandler: nil)
        }
        
//        if MFMailComposeViewController.canSendMail()
//            {
//            let mailComposer = MFMailComposeViewController()
//            mailComposer.mailComposeDelegate = self
//            mailComposer.setToRecipients(["https://gds.google.com/web/chip?ep=p&gdsid=689285878&authuser=0&hl=en-GB&continue=https://accounts.google.com/ServiceLogin?continue%3Dhttps%253A%252F%252Fmail.google.com%252Fmail%252F%26service%3Dmail%26hl%3Den-GB%26authuser%3D0%26passive%3Dtrue%26sarp%3D1%26aodrpl%3D1%26checkedDomains%3Dyoutube%26checkConnection%3Dyoutube%253A206%253A0%26pstMsg%3D1&service=mail&rapt=AEjHL4Mwppe3yHMlPZdeH2zBGTkfsA4RHQR6Jsfn5jnvPBqLNXxKiHqe2DWpW9obgzuWFmhsmjMgLUr-aFW1c8aiM_nf3cSlxg&pli=1"])
//            mailComposer.setSubject("")
//            mailComposer.setMessageBody("Hi there,plese type your issues here...", isHTML: false)
//            present(mailComposer, animated: true, completion: nil) }
//            else { // Show an alert indicating that the device cannot send emails
//                let alertController = UIAlertController(title: "Error", message: "Your device cannot send emails.", preferredStyle:.alert)
//                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//                alertController.addAction(okAction)
//                present(alertController, animated: true, completion: nil)
//
//            }
        } // MARK: - MFMailComposeViewControllerDelegate
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) { controller.dismiss(animated: true, completion: nil) }
    
//
//    @IBAction func composeEmailTapped(_ sender: UIButton) { if MFMailComposeViewController.canSendMail() { let mailComposer = MFMailComposeViewController() mailComposer.mailComposeDelegate = self mailComposer.setToRecipients(["your-email@example.com"]) mailComposer.setSubject("Feedback or Inquiry") mailComposer.setMessageBody("Hi there,\n\nI have some feedback/inquiry...", isHTML: false) present(mailComposer, animated: true, completion: nil) } else { // Show an alert indicating that the device cannot send emailslet alertController = UIAlertController(title: "Error", message: "Your device cannot send emails.", preferredStyle: .alert) let okAction = UIAlertAction(title: "OK", style: .default, handler: nil) alertController.addAction(okAction) present(alertController, animated: true, completion: nil) } } // MARK: - MFMailComposeViewControllerDelegatefunc mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) { controller.dismiss(animated: true, completion: nil) }
//    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}

