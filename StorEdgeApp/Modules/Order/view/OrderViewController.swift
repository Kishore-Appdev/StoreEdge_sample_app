//
//  OrderViewController.swift
//  StorEdgeApp
//
//  Created by admin on 25/07/23.
//

import UIKit

class OrderViewController: UIViewController,Storyboard,ConfirmViewDelegate,PrepareViewDelegate,DeliverViewDelegate{
   
    
    static var storyboard=AppStoryboard.order
    var coordinator:OrderVCFlow?
    var confirmView:ConfirmView!
    var prepareView:PrepareView!
    var deliverView:DeliverView!
    var completedView:CompletedView!
 
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var prepareButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var deliverButton: UIButton!
    @IBOutlet weak var completedButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmView=ConfirmView.instanceFromNib()
        confirmView.confirmDelegate=self
        prepareView=PrepareView.instanceFromNib()
        prepareView.prepareDelegate=self
        deliverView=DeliverView.instanceFromNib()
        deliverView.deliverDelegate=self
        self.containerView.addSubview(confirmView)
        print("ConfirmView instance address in viewDidLoad: \(Unmanaged.passUnretained(confirmView).toOpaque())")
//        prepareView=PrepareView()
         navigationBarSetup()
        instantiateSubViews()
        showView(confirmView)
    }
    
//   deinit{
//        removeBottomBorderLines()
//    }
   
    @objc func menuListButtonTapped(){
        coordinator?.coordinateToMenuVC()
    }
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        print("ConfirmView instance address in viewDidLoad: \(Unmanaged.passUnretained(confirmView).toOpaque())")
      
//        guard let confirmView=confirmView else{
//            print("error:confirm view is nil")
//            return
//        }
        showView(confirmView)
//        if (confirmView.superview!=nil) {
//            confirmButton.addBottomBorderLineWithColor(color: .red, width: 1)
//        }
        print("ConfirmView instance address in viewDidLoad: \(Unmanaged.passUnretained(confirmView).toOpaque())")
        print(confirmView.isHidden)
    }
    @IBAction func prepareButtonTapped(_ sender: Any) {
        showView(prepareView)
        print(prepareView.isHidden)
    }
    @IBAction func deliverButtonTapped(_ sender: Any) {
        showView(deliverView)
    }
    @IBAction func completedButtonTapped(_ sender: Any) {
        showView(completedView)
    }
    
    func sendSelectedDeliveryOrder(_ selDelOrder: Order) {
        showView(completedView)
        completedView.completedArr.append(selDelOrder)
        
    }
    
    func sendSelectedPrepareData(_ selectPrepareOrder: Order) {
        showView(deliverView)
        deliverView.deliverArr.append(selectPrepareOrder)
//        showView(deliverView)
    }
    
    func didTapConfirmButton(selectedOrder: Order) {
        
//        print("orderselecteddddd:\(selectedOrder.OrderTotal)")
        prepareView.prepareArr.append(selectedOrder)
        showView(prepareView)
        print("oooo:\(prepareView.prepareArr.count)")
    }
    
    func instantiateSubViews(){
        loadConfirmView()
        loadPrepareView()
        loadDeliverView()
        loadCompletedView()
    }
    func loadConfirmView() {

//        self.confirmView=ConfirmView.instanceFromNib()
        confirmView.translatesAutoresizingMaskIntoConstraints = false

        self.containerView.addSubview(self.confirmView)

        // Constraints
        self.confirmView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 5).isActive = true
        self.confirmView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -5).isActive = true
        self.confirmView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 5.0).isActive = true
        self.confirmView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -5).isActive = true


    }
    
    func loadPrepareView(){
//        self.prepareView=PrepareView.instanceFromNib()
        prepareView.translatesAutoresizingMaskIntoConstraints=false
        self.containerView.addSubview(self.prepareView)

        //constraints
        self.prepareView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 5).isActive = true
        self.prepareView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -5).isActive = true
        self.prepareView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 5.0).isActive = true
        self.prepareView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -5).isActive = true
//        self.prepareView.frame=containerView.bounds
//        print(prepareView.frame)
    }
    
    func loadDeliverView(){
//        self.deliverView=DeliverView.instanceFromNib()
        deliverView.translatesAutoresizingMaskIntoConstraints=false
        self.containerView.addSubview(deliverView)

        //constraints
        self.deliverView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 5).isActive = true
        self.deliverView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -5).isActive = true
        self.deliverView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 5.0).isActive = true
        self.deliverView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -5).isActive = true
        print(deliverView.frame)
        print(confirmView.frame)
        print(prepareView.frame)

    }
    
    func loadCompletedView(){
        self.completedView=CompletedView.instanceFromNib()
        self.containerView.addSubview(completedView)
        completedView.translatesAutoresizingMaskIntoConstraints=false
        //constraints
        self.completedView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 5).isActive = true
        self.completedView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -5).isActive = true
        self.completedView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 5.0).isActive = true
        self.completedView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -5).isActive = true
        print(completedView.frame)
    }
    
    
    
    
    private func showView(_ viewToShow: UIView)
    {
       
        for view in containerView.subviews{
            view.isHidden = view != viewToShow
            print("show view function hidden \(view.description)=\(view.isHidden) and ")
        }
        checkSubViewVisibilityForAddingBorderLine()

        
    }
    func checkSubViewVisibilityForAddingBorderLine(){
        for subview in containerView.subviews{
            if !subview.isHidden {
                print("subview ishiddenproperty\(subview.description)=\(subview.isHidden)")
                if subview==confirmView{
                    confirmButton.addBottomBorderLineWithColor(color: .red, width: 1)
//                    confirmButton.addTopBorderLineWithColor(color: .black
//                                                            , width: 1)
                    setBoldButton("Confirm", confirmButton, true)
//                    confirmButton.setTitle("CONFIRM", for: .normal)
//                    confirmButton.titleLabel?.font=UIFont.boldSystemFont(ofSize: confirmButton.titleLabel?.font.pointSize ?? 100)
                }
                else if subview==prepareView{
                    prepareButton.addBottomBorderLineWithColor(color: .red, width: 1)
                    setBoldButton("Prepare", prepareButton, true)
                }
                else if subview==deliverView{
                    deliverButton.addBottomBorderLineWithColor(color: .red, width: 1)
                    setBoldButton("Deliver", deliverButton, true)
                }
                else if subview==completedView{
                    completedButton.addBottomBorderLineWithColor(color: .red, width: 1)
                    setBoldButton("Completed", completedButton, true)
                }
                
            }
            else{
                if subview==confirmView{
                    confirmButton.addBottomBorderLineWithColor(color: .white, width: 1)
                    setBoldButton("Confirm", confirmButton, false)
                }
                else if subview==prepareView{
                    prepareButton.addBottomBorderLineWithColor(color: .white, width: 1)
                    setBoldButton("Prepare", prepareButton, false)

                }
                else if subview==deliverView{
                    deliverButton.addBottomBorderLineWithColor(color: .white, width: 1)
                    setBoldButton("Deliver", deliverButton, false)

                }
                else if subview==completedView{
                    completedButton.addBottomBorderLineWithColor(color: .white, width: 1)
                    setBoldButton("Completed", completedButton, false)

                }
            }
        }
    }
    
    func navigationBarSetup(){
       navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(menuListButtonTapped))]
        navigationItem.leftBarButtonItem=UIBarButtonItem(title: "Orders", style: .done, target: self, action: nil)
       navigationController?.setNavigationBarHidden(false, animated: true)
       }
    
    func setBoldButton(_ ButtonTitle:String,_ yourButton:UIButton, _ isBold:Bool){
        
        let font=isBold ? UIFont.boldSystemFont(ofSize: yourButton.titleLabel?.font.pointSize ?? 15) : UIFont.systemFont(ofSize: yourButton.titleLabel?.font.pointSize ?? 15)
        
        let attributes: [NSAttributedString.Key:Any]=[.font:font]
        let attributedString=NSAttributedString(string: ButtonTitle,attributes: attributes)
        yourButton.setAttributedTitle(attributedString, for: .normal)
    }
    
    func removeBottomBorderLines(){
        confirmButton.removeObserver(confirmButton, forKeyPath: "bounds")
        prepareButton.removeObserver(prepareButton, forKeyPath: "bounds")
        deliverButton.removeObserver(deliverButton, forKeyPath: "bounds")
        completedButton.removeObserver(completedButton, forKeyPath: "bounds")
        
        
    }


    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



//        containerView.subviews[0].isHidden=false
//        confirmView.frame=containerView.bounds
//      confirmView.backgroundColor=UIColor.red
//        containerView.addSubview(confirmView)
//        confirmView=ConfirmView()
//        prepareView=PrepareView()
//        deliverView=DeliverView()
//        completedView=CompletedView()
//
//        containerView.addSubview(prepareView)
//        containerView.addSubview(deliverView)
//        containerView.addSubview(completedView)
//        print(containerView.subviews)

//private func setupSubViewsConstraints() { // Disable autoresizing mask translation to constraints for custom views
//        containerView.addSubview(confirmView)
    
//        confirmView.translatesAutoresizingMaskIntoConstraints = false
//        prepareView.translatesAutoresizingMaskIntoConstraints = false
//        deliverView.translatesAutoresizingMaskIntoConstraints = false
//        completedView.translatesAutoresizingMaskIntoConstraints = false
    // Add constraints to position and size each custom view within the container view
//        NSLayoutConstraint.activate([ confirmView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
//                                      confirmView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
//                                      confirmView.topAnchor.constraint(equalTo: containerView.topAnchor),
//                                      confirmView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
//                                      prepareView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
//                                      prepareView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
//                                      prepareView.topAnchor.constraint(equalTo: containerView.topAnchor),
//                                      prepareView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
//                                      deliverView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
//                                      deliverView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
//                                      deliverView.topAnchor.constraint(equalTo: containerView.topAnchor),
//                                      deliverView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
//                                      completedView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
//                                      completedView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
//                                      completedView.topAnchor.constraint(equalTo: containerView.topAnchor),
//                                      completedView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
//                                    ])
//        containerView.addSubview(confirmView)

    
//}
