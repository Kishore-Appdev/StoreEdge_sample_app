//
//  ProductsViewController.swift
//  StorEdgeApp
//
//  Created by admin on 26/07/23.
//
import Foundation
import UIKit
protocol MenuTableUpdateDelegate:AnyObject{
    func menuTableReload()
}
class ProductsViewController: UIViewController,Storyboard,UITableViewDelegate,UITableViewDataSource,MenuTableUpdateDelegate {

    
    static var storyboard=AppStoryboard.products
    var productViewModel=ProductViewModel()
    var coordinator:ProductsVCFlow?
    var listOfProducts:[ProductModel]{return
            ProductViewModel().productsFetchFromDB()
    }
    var isAscendingSort=true
    var sortedListOfProducts:[ProductModel]=[]
    
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var productTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup()
        instatiateTableView()
        productViewModel.productsSave()
        productTableView.separatorStyle = .none
//        navigationController?.navigationBar.addBottomBorderLineWithColor(color: .black, width: 1)
    }
    
    func instatiateTableView(){
        self.productTableView.register(UINib(nibName: "ProductsViewCellTableViewCell", bundle: nil), forCellReuseIdentifier: "productcell")
        self.productTableView.dataSource=self
        self.productTableView.delegate=self
        // Assuming you have a reference to your UITableView instance called 'tableView'

        // Adjusting content insets
        self.productTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

    }
   
    
    func navigationBarSetup(){
       navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(menuListButtonTapped))]
        navigationItem.leftBarButtonItem=UIBarButtonItem(title: "Products", style: .done, target: self, action: nil)
       navigationController?.setNavigationBarHidden(false, animated: true)
//        navigationController?.navigationBar.setCustomTitleAttributes(color: .orange, font: UIFont.boldSystemFont(ofSize: 40.0))
//        navigationController?.navigationBar.setCustomTintColor(.red)
//        navigationController?.navigationBar.setCustomBarButtonAttributes(color: .orange, font: UIFont.boldSystemFont(ofSize: 40.0))
        navigationController?.navigationBar.setDarkOrangeAppearance()
       }
   @objc func menuListButtonTapped(){
       coordinator?.coordinateToMenuVC()
   }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listOfProducts.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "productcell", for: indexPath) as! ProductsViewCellTableViewCell
        
        if sortedListOfProducts.isEmpty {
            cell.productNameLabel.text=listOfProducts[indexPath.section].productName
            cell.availableQuantityLabel.text=String(listOfProducts[indexPath.section].avilableQuantity)
            cell.lastUpdateLabel.text=listOfProducts[indexPath.section].lastUpdate
            cell.productImage.image=UIImage(named: listOfProducts[indexPath.section].productImage)
            print("item name-\(listOfProducts[indexPath.section].productName) image-\(listOfProducts[indexPath.section].productImage)" )
            return cell
        }
        else{
            cell.productNameLabel.text=sortedListOfProducts[indexPath.section].productName
            cell.availableQuantityLabel.text=String(sortedListOfProducts[indexPath.section].avilableQuantity)
            cell.lastUpdateLabel.text=sortedListOfProducts[indexPath.section].lastUpdate
            cell.productImage.image=UIImage(named: sortedListOfProducts[indexPath.section].productImage)
            print("item name-\(sortedListOfProducts[indexPath.section].productName) image-\(sortedListOfProducts[indexPath.section].productImage)" )
            return cell
        }
        }
        
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }
 
  
    func menuTableReload() {
        productTableView.reloadData()
    }
    
    
    @IBAction func filterButtonTapped(_ sender: Any) {
       
        isAscendingSort.toggle()
        if isAscendingSort{
            sortedListOfProducts=listOfProducts.sorted{$0.productName<$1.productName}
        }
        else{
            sortedListOfProducts=listOfProducts.sorted{$0.productName>$1.productName}
        }
        productTableView.reloadData()
   
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
