//
//  CustomersViewController.swift
//  StorEdgeApp
//
//  Created by admin on 26/07/23.
//

import UIKit

class CustomersViewController: UIViewController,Storyboard,UITableViewDelegate,UITableViewDataSource,CustomCellDelegate,SelectedCustomer{
  
    
 
    var delegate:SelectedCustomer?
    var selectedCustomer:CustomerModel!
    static var storyboard=AppStoryboard.customers
    var coordinator:CustomersVCFlow?
    var customerViewModel=CustomerViewModel()
    var fetchedCustomersArray:[CustomerModel]{
        return CustomerViewModel().customersFetchFromDB()
    }
    
    @IBOutlet weak var customersTableView: UITableView!
    @IBOutlet weak var CustomerStaticHeaderCell: UITableViewCell!
    var searching=false
    var searchedCustomersArr=[CustomerModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customerViewModel.customerSave()
        navigationBarSetup()
       instantiateCustomerTableView()
        
        // Do any additional setup after loading the view.
    }
    func navigateToViewCustomerVC(){
       let storyboard=UIStoryboard(name: "ViewCustomer", bundle: nil)
        
       guard let viewcustomervc=storyboard.instantiateViewController(withIdentifier: "ViewCustomerInfoViewController") as? ViewCustomerInfoViewController else{
            return
            
        }
        viewcustomervc.customerSelected=self.selectedCustomer
        viewcustomervc.delegate=self
        
        navigationController?.pushViewController(viewcustomervc, animated: true)
//        coordinator?.coordinateToViewCustomerVC()
//        ViewCustomerInfoViewController().customerSelected=self.selectedCustomer
//            ViewCustomerInfoViewController().delegate=self
        }
    func returnSelCustomer(_ data: CustomerModel) {
        print("selectedCustomer:\(data)")
//        let data=self.selectedCustomer
    }
          
          
    func customCellButtonTapped(_ cell:CustomerTableViewCell,_ selectedData:CustomerModel) {
        if let indexPath=customersTableView.indexPath(for: cell){
            self.selectedCustomer=fetchedCustomersArray[indexPath.row]
           navigateToViewCustomerVC()
        }
    }
    
    
    func instantiateCustomerTableView(){
        self.customersTableView.register(UINib(nibName: "CustomerTableViewCell", bundle: nil), forCellReuseIdentifier: "customercell")
        self.customersTableView.dataSource=self
    }
    
    
    func navigationBarSetup(){
       navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(menuListButtonTapped))]
        navigationItem.leftBarButtonItem=UIBarButtonItem(title: "Customers", style: .done, target: self, action: nil)
       navigationController?.setNavigationBarHidden(false, animated: true)
       }
    
   @objc func menuListButtonTapped(){
       coordinator?.coordinateToMenuVC()
   }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return searchedCustomersArr.count
        }
        else{
           return  customerViewModel.customersFetchFromDB().count
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "customercell", for: indexPath) as! CustomerTableViewCell
        if searching{
            cell.contactNO.text=searchedCustomersArr[indexPath.row].phoneNumber
            cell.name.text=searchedCustomersArr[indexPath.row].fullName
            cell.delegate=self
            return cell
        }
        else{
            cell.contactNO.text=fetchedCustomersArray[indexPath.row].phoneNumber
            cell.name.text=fetchedCustomersArray[indexPath.row].fullName
            cell.delegate=self
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
        
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

extension CustomersViewController:UISearchBarDelegate{
    func searchBar(_ searchBar:UISearchBar,textDidChange searchText:String){
        searchedCustomersArr=fetchedCustomersArray.filter({$0.fullName.lowercased().prefix(searchText.count)==searchText.lowercased()})
        searching=true
        customersTableView.reloadData()
        
        func searchCancelButtonClicked(_ searchBar:UISearchBar){
            searching=false
            searchBar.text=""
            customersTableView.reloadData()
        }
    }
    
}
