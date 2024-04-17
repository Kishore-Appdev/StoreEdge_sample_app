//
//  DeliverView.swift
//  StorEdgeApp
//
//  Created by admin on 25/07/23.
//

import UIKit
protocol DeliverViewDelegate:AnyObject{
    func sendSelectedDeliveryOrder(_ selDelOrder:Order)
}
class DeliverView: UIView, UITableViewDelegate, UITableViewDataSource, DeliverCellDelegate{
    
    weak var deliverDelegate:DeliverViewDelegate?
    func passDeliverCellTapped(_ cell: DeliverTableViewCell) {
        guard let indexPath=deliverTableView.indexPath(for: cell) else {return}
         let selDeliveryOrder=deliverArr[indexPath.row]
        deliverDelegate?.sendSelectedDeliveryOrder(selDeliveryOrder)
        deliverArr.remove(at: indexPath.row)
        deliverTableView.reloadData()
        
    }
    

    

    @IBOutlet weak var deliverTableView: UITableView!
    
    
    var deliverArr:[Order] = []{
        didSet{
//       deliverTableView.reloadData()
            print(deliverArr.count)
            deliverTableView.reloadData()
        }
    }
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        deliverTableView.register(UINib(nibName:"ConfirmTableCell", bundle: nil), forCellReuseIdentifier: "confirmcell")
        deliverTableView.delegate=self
        deliverTableView.dataSource=self
//        print("nowsee:\(prepareArr[0])")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return deliverArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("deliver count: \(deliverArr.count)")
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "confirmcell", for: indexPath) as! ConfirmTableCell
        cell.customerNameLabel.text=deliverArr[indexPath.section].customerName
        cell.customerImage.image=UIImage(named: "yatinImage")
        cell.noOfItemsLabel.text=deliverArr[indexPath.section].totalNoOfItems
        cell.orderTotal.text=deliverArr[indexPath.section].OrderTotal
        cell.productDescLabel.text=deliverArr[indexPath.section].productDescription
        cell.productImage.image=UIImage(named:deliverArr[indexPath.section].productImage)
        cell.productName.text=deliverArr[indexPath.section].productName
        cell.productPrice.text=deliverArr[indexPath.section].Price
        cell.quantityOfProductLabel.text=deliverArr[indexPath.section].QuantityOfParticularItem
        cell.actionButton.setTitle("Deliver", for: .normal)
        cell.actionDescriptionLabel.text="waiting for Deliver"
        cell.delegate=self
        cell.selectionStyle = .none
        return cell
//        cell.deliverLAbel.text=deliverArr[indexPath.row].orderName
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        deliverArr.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell=tableView.dequeueReusableCell(withIdentifier: "delivercell", for: indexPath) as! DeliverTableViewCell
//        cell.deliverLAbel.text=deliverArr[indexPath.row].orderName
//        return cell
//
//    }
    
    class func instanceFromNib()->DeliverView{
        return nib.instantiate(withOwner: nil,options: nil)[0] as! DeliverView
    }
    
    static var nib:UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier:String{
        return String(describing: self)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension DeliverView:ConfirmTableViewCellDelegate{
    func confirmButtonTapped(for cell: ConfirmTableCell) {
        guard let indexPath=deliverTableView.indexPath(for: cell) else{return}
        let selPrepareOrder=deliverArr[indexPath.section]
        deliverDelegate?.sendSelectedDeliveryOrder(selPrepareOrder)
        deliverArr.remove(at: indexPath.row)
        deliverTableView.reloadData()
        //        delegate?.prepareButtonTappedInsideCell(cell)
    }}
