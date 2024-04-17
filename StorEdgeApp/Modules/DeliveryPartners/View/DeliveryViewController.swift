//
//  DeliveryPartnersViewController.swift
//  StorEdgeApp
//
//  Created by admin on 26/07/23.
//

import UIKit
protocol DeliveryVCDelegate:AnyObject{
    func deliveryPartnerCellTapped(_ selectedPartner:DeliveryPartnerModel)
}
class DeliveryViewController: UIViewController,Storyboard, UITableViewDelegate, UITableViewDataSource {
 
    var delegate:DeliveryVCDelegate?
    static var storyboard=AppStoryboard.deliveryPartners
    var deliveryPartnerViewModel=DeliveryPartnerViewModel()
    var coordinator:DeliveryVCFlow?
    
    @IBOutlet weak var deliveryPartnerTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup()
        deliveryPartnerViewModel.saveDeliveryPatnersToDb()
        deliveryPartnerTableView.register(UINib(nibName: "DeliveryPartnerTableViewCell", bundle: nil), forCellReuseIdentifier: "deliverypartnercell")
        deliveryPartnerTableView.delegate=self
        deliveryPartnerTableView.dataSource=self
        // Do any additional setup after loading the view.
    }
    
    func navigationBarSetup(){
       navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(menuListButtonTapped))]
        navigationItem.leftBarButtonItem=UIBarButtonItem(title: "DeliveryPartners", style: .done, target: self, action: nil)
       navigationController?.setNavigationBarHidden(false, animated: true)
       }
   @objc func menuListButtonTapped(){
       coordinator?.coordinateToMenuVC()
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

extension DeliveryViewController{
    func numberOfSections(in tableView: UITableView) -> Int {
        return deliveryPartnerViewModel.fetchDeliveryPartnersFromDb().count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        print(deliveryPartnerViewModel.fetchDeliveryPartnersFromDb().count)
       return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "deliverypartnercell", for: indexPath) as! DeliveryPartnerTableViewCell
        cell.iDLabel.text=deliveryPartnerViewModel.fetchedDeliveryPartnersArr[indexPath.section].id
        cell.nameLAbe.text=deliveryPartnerViewModel.fetchedDeliveryPartnersArr[indexPath.section].userName
        cell.noOfDeliveryLabel.text=String(deliveryPartnerViewModel.fetchedDeliveryPartnersArr[indexPath.section].noOfDelivery)
        cell.noOfRatingsProvidedlabel.text=String(deliveryPartnerViewModel.fetchedDeliveryPartnersArr[indexPath.section].noOfPeopleGaveRatings)
        cell.deliveryPartnerStatusButton.setTitle(deliveryPartnerViewModel.fetchedDeliveryPartnersArr[indexPath.section].status, for: .normal)
        cell.deliveryPartnerStatusButton.titleLabel!.font=UIFont.systemFont(ofSize: 5.0)
        cell.deliveryPartnerImage.image=UIImage(named: deliveryPartnerViewModel.fetchedDeliveryPartnersArr[indexPath.section].imageName)
        print("image name:\(deliveryPartnerViewModel.fetchedDeliveryPartnersArr[indexPath.section].imageName)")
        cell.ratingLabel.text=String(deliveryPartnerViewModel.fetchedDeliveryPartnersArr[indexPath.section].ratings)
        if(  deliveryPartnerViewModel.fetchedDeliveryPartnersArr[indexPath.section].status=="Available"){
            cell.deliveryPartnerStatusButton.backgroundColor=UIColor(red: 0.0, green: 0.5, blue: 0.0, alpha: 1.0)
        }
        else if(  deliveryPartnerViewModel.fetchedDeliveryPartnersArr[indexPath.section].status=="Engaged"){
            cell.deliveryPartnerStatusButton.backgroundColor=UIColor(red: 0.9, green: 0.7, blue: 0.0, alpha: 1.0)
        }
        else{
            cell.deliveryPartnerStatusButton.backgroundColor=UIColor.red
        }
        print(cell.deliveryPartnerStatusButton.titleLabel?.text!)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell=tableView.cellForRow(at: indexPath)
        
        cell?.backgroundColor=UIColor.white
                let selectedDeliveryPartner=deliveryPartnerViewModel.fetchedDeliveryPartnersArr[indexPath.section]
       
        let storyboard=UIStoryboard(name: "ViewDeliveryPartnerInfoView", bundle: nil)
         
         let viewDelivaryPartnervc=(storyboard.instantiateViewController(withIdentifier: "ViewDeliveryPartnerInfoViewController") as! ViewDeliveryPartnerInfoViewController)
       
        let instance=viewDelivaryPartnervc
        self.delegate=instance
       
        delegate?.deliveryPartnerCellTapped(selectedDeliveryPartner)
         self.navigationController?.pushViewController(viewDelivaryPartnervc, animated: true)
        
    }
//    func setStatusButtoncolor(button:String){
//        if (button==Available){}
//        button.backgroundColor=UIColor.red
//        button.backgroundColor=UIColor.green
//        button.backgroundColor=UIColor.yellow
//        if()
//
//    }
}
