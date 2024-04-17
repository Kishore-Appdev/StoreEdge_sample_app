//
//  CompletedView.swift
//  StorEdgeApp
//
//  Created by admin on 25/07/23.
//

import UIKit

class CompletedView: UIView,UITableViewDelegate,UITableViewDataSource{
  
    

    @IBOutlet weak var CompletedTableView: UITableView!
    
    var completedArr:[Order]=[]{
        didSet{
            CompletedTableView.reloadData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        CompletedTableView.register(UINib(nibName:"ConfirmTableCell", bundle: nil), forCellReuseIdentifier: "confirmcell")
        CompletedTableView.delegate=self
        CompletedTableView.dataSource=self
    }
    class func instanceFromNib()->CompletedView{
        return nib.instantiate(withOwner: nil)[0] as! CompletedView
    }
    static var nib:UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier:String{
        return String(describing: self)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return completedArr.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "confirmcell", for: indexPath) as! ConfirmTableCell
        cell.customerNameLabel.text=completedArr[indexPath.section].customerName
        cell.customerImage.image=UIImage(named: "yatinImage")
        cell.noOfItemsLabel.text=completedArr[indexPath.section].totalNoOfItems
        cell.orderTotal.text=completedArr[indexPath.section].OrderTotal
        cell.productDescLabel.text=completedArr[indexPath.section].productDescription
        cell.productImage.image=UIImage(named:completedArr[indexPath.section].productImage)
        cell.productName.text=completedArr[indexPath.section].productName
        cell.productPrice.text=completedArr[indexPath.section].Price
        cell.quantityOfProductLabel.text=completedArr[indexPath.section].QuantityOfParticularItem
        cell.actionButton.setTitle("Completed", for: .normal)
        cell.actionDescriptionLabel.text=""
        cell.selectionStyle = .none
                return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

//extension CompletedView:ConfirmTableViewCellDelegate{
//    func confirmButtonTapped(for cell: ConfirmTableViewCell) {
//        guard let indexPath=CompletedTableView.indexPath(for: cell) else{return}
//        let selPrepareOrder=CompletedTableView[indexPath.section]
//        deliverDelegate?.sendSelectedDeliveryOrder(selPrepareOrder)
//        deliverArr.remove(at: indexPath.row)
//        deliverTableView.reloadData()
//        //        delegate?.prepareButtonTappedInsideCell(cell)
//    }}
