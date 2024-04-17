//
//  PrepareView.swift
//  StorEdgeApp
//
//  Created by admin on 25/07/23.
//

import UIKit
protocol PrepareViewDelegate:AnyObject{
    func sendSelectedPrepareData(_ selectPrepareOrder:Order)
}
class PrepareView: UIView,UITableViewDelegate,UITableViewDataSource,PrepareCellDelegate{
    weak var prepareDelegate:PrepareViewDelegate?
    weak var delegate:PrepareCellDelegate?
    @IBOutlet weak var prepareTableView: UITableView!
    
    var prepareArr:[Order] = []{
        didSet{
            prepareTableView.reloadData()
            print(prepareArr)
           
        }
    }
    
 
   
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareTableView.register(UINib(nibName:"ConfirmTableCell", bundle: nil), forCellReuseIdentifier: "confirmcell")
        prepareTableView.delegate=self
        prepareTableView.dataSource=self
//      print("nowsee:\(prepareArr[0])")
    }
    
    
    func prepareButtonTappedInsideCell(_ cell: ConfirmTableCell) {
        guard let indexPath=prepareTableView.indexPath(for: cell) else{return}
        let selPrepareOrder=prepareArr[indexPath.row]
        prepareDelegate?.sendSelectedPrepareData(selPrepareOrder)
        prepareArr.remove(at: indexPath.row)
        prepareTableView.reloadData()
     
    }
    
    class func instanceFromNib()->PrepareView{
        return PrepareView.nib.instantiate(withOwner: nil,options: nil)[0] as! PrepareView
    }

    static var nib:UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    static var identifier:String{
        return String(describing: self)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print(prepareArr.underestimatedCount)
        return prepareArr.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count\(prepareArr.count)")

        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "confirmcell", for: indexPath) as! ConfirmTableCell
        cell.customerNameLabel.text=prepareArr[indexPath.section].customerName
        cell.customerImage.image=UIImage(named: "yatinImage")
        cell.noOfItemsLabel.text=prepareArr[indexPath.section].totalNoOfItems
        cell.orderTotal.text=prepareArr[indexPath.section].OrderTotal
        cell.productDescLabel.text=prepareArr[indexPath.section].productDescription
        cell.productImage.image=UIImage(named:prepareArr[indexPath.section].productImage)
        cell.productName.text=prepareArr[indexPath.section].productName
        cell.productPrice.text=prepareArr[indexPath.section].Price
        cell.quantityOfProductLabel.text=prepareArr[indexPath.section].QuantityOfParticularItem
        cell.actionButton.setTitle("Prepare", for: .normal)
        cell.actionButton.titleLabel?.font=UIFont.systemFont(ofSize: 5, weight: .regular)
        cell.actionDescriptionLabel.text="waiting for prepare"
        cell.delegate=self
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

extension PrepareView:ConfirmTableViewCellDelegate{
    func confirmButtonTapped(for cell: ConfirmTableCell) {
        guard let indexPath=prepareTableView.indexPath(for: cell) else{return}
        let selPrepareOrder=prepareArr[indexPath.section]
        prepareDelegate?.sendSelectedPrepareData(selPrepareOrder)
        prepareArr.remove(at: indexPath.row)
        prepareTableView.reloadData()
//        delegate?.prepareButtonTappedInsideCell(cell)
    }
    
    
}
