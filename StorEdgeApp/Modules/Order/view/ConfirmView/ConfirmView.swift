//
//  ConfirmView.swift
//  StorEdgeApp
//
//  Created by admin on 25/07/23.
//

protocol ConfirmViewDelegate:AnyObject{
    func didTapConfirmButton(selectedOrder:Order)
}

import UIKit
class ConfirmView: UIView,UITableViewDelegate,UITableViewDataSource, ConfirmTableViewCellDelegate{
    weak var confirmDelegate:ConfirmViewDelegate?
    
    var ordersArr:[Order]=[Order(customerName: "Yatin Vij", productName: "ZestyChicken Wrap", productDescription: "A tasty mixture of chicken and fresh ingredients served with a dollop...", QuantityOfParticularItem: "x1", Price: "$ 34.00", totalNoOfItems: "2 items", OrderTotal: "$ 45.00", productImage: "Zesty"),
                           Order(customerName: "Ramkumar", productName: "Chessy Garlic Breadssticks", productDescription: "Dry bread characterized by a crispy and crunchy texture resembling that...", QuantityOfParticularItem: "x1", Price: "$ 34.00", totalNoOfItems: "", OrderTotal: "$ 16", productImage: "ChessyGarlic")]
    
    @IBOutlet weak var confirmTableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        confirmTableView.register(UINib(nibName:"ConfirmTableCell", bundle: nil), forCellReuseIdentifier: "confirmcell")
        confirmTableView.delegate=self
        confirmTableView.dataSource=self
    }
   
    func confirmButtonTapped(for cell:ConfirmTableCell){
        guard let indexPath=confirmTableView.indexPath(for: cell) else{return}
        let selectedOrder=ordersArr[indexPath.section]
        confirmDelegate?.didTapConfirmButton(selectedOrder: selectedOrder)
//        ordersArr.remove(at: indexPath.row)
//        confirmTableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    
    @IBOutlet weak var confirmImage: UIImageView!

    class func instanceFromNib() -> ConfirmView {
        
        return ConfirmView.nib.instantiate(withOwner: nil, options: nil)[0] as! ConfirmView
    }
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    // Identifier
    static var identifier: String {
        return String(describing: self)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ordersArr.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("orderscount:\(ordersArr.count)")
        return 1
     
    }
    
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "confirmcell", for: indexPath) as! ConfirmTableCell
        cell.customerNameLabel.text=ordersArr[indexPath.section].customerName
        cell.customerImage.image=UIImage(named: "yatinImage")
        cell.noOfItemsLabel.text=ordersArr[indexPath.section].totalNoOfItems
        cell.orderTotal.text=ordersArr[indexPath.section].OrderTotal
        cell.productDescLabel.text=ordersArr[indexPath.section].productDescription
        cell.productImage.image=UIImage(named:ordersArr[indexPath.section].productImage)
        cell.productName.text=ordersArr[indexPath.section].productName
        cell.productPrice.text=ordersArr[indexPath.section].Price
        cell.quantityOfProductLabel.text=ordersArr[indexPath.section].QuantityOfParticularItem
        cell.actionButton.setTitle("Confirm", for: .normal)
        cell.delegate=self
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell=tableView.cellForRow(at: indexPath)
        
        cell?.backgroundColor=UIColor.white
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
   
//    private func commonInit(){
//        self.backgroundColor=UIColor.blue
//    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
