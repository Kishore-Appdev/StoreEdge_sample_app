//
//  CoreDataHelper.swift
//  StorEdgeApp
//
//  Created by admin on 26/07/23.
//

import Foundation
import CoreData
import UIKit
class DataBaseHelper{
    static var shareInstance=DataBaseHelper()
    let context=(UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
    
    
    
    func saveCoreData() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.saveContext()
        }
    }
    
    func deleteByEntityName(entityName:String) {
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        do {
            _ = try self.context.execute(request)
        } catch let error {
            print("Error in \(entityName) deletion: \(error.localizedDescription)")
        }
        // Save the data to coredata
        self.saveCoreData()
    }
    
    
    func saveProducts(_ productModles:[ProductModel]){
        for productModel in productModles{
            let productdb=ProductEntity(context: context)
            productdb.productName=productModel.productName
            productdb.availableQuantity=Int32(productModel.avilableQuantity)
            productdb.lastUpdate=productModel.lastUpdate
            productdb.productImage=productModel.productImage    }
        do{
            try context.save()
        }catch{
            print("error saving product to db:\(error)")
        }
    }
    
    func fetchProducts()->[ProductModel]{
        let fetchRequest:NSFetchRequest<ProductEntity>=ProductEntity.fetchRequest()
        do{
            let fetchedProducts=try context.fetch(fetchRequest)
            let productModels=fetchedProducts.map{p in ProductModel(productName: p.productName ?? "",
                                                                    avilableQuantity: Int(p.availableQuantity),
                                                                    lastUpdate: p.lastUpdate ?? "",
                                                                    productImage: p.productImage ?? "")
                                                                    }
            return productModels
        }catch{
            print("error fetching products from db:\(error)")
            return []
        }
    }
   
    
    func saveCustomers(_ customerModles:[CustomerModel]){
        for customer in customerModles{
            let customerDb=CustomersDb(context: context)
            customerDb.firstName=customer.firstName
            customerDb.lastName=customer.lastName
            customerDb.fullName=customer.fullName
            customerDb.dateOfBirth=customer.dateOfBirth
            customerDb.gender=customer.gender
            customerDb.phoneNumber=customer.phoneNumber
            customerDb.email=customer.email
            customerDb.address=customer.address
            customerDb.customerSince=customer.customerSince
            customerDb.totalNumberOfOrders=customer.totalNumberOfOrders
            customerDb.numberOfCancelOrders=Int32(customer.noOfCancelOrders)
            customerDb.prefferedPayment=customer.prefferedPayment
            customerDb.customerImage=customer.customerImage
        }
        do{
            try context.save()
        }catch{
            print("error saving customers to db:\(error)")
        }
    }
    
    func fetchCustomers()->[CustomerModel]{
        let fetchRequest:NSFetchRequest<CustomersDb>=CustomersDb.fetchRequest()
        do{
            let fetchedCustomers=try context.fetch(fetchRequest)
            let customerModelArr=fetchedCustomers.map{customer in CustomerModel(firstName: customer.firstName ?? "", lastName: customer.lastName ?? "", fullName: customer.fullName ?? "", dateOfBirth: customer.dateOfBirth ?? "", gender: customer.gender ?? "", phoneNumber: customer.phoneNumber ?? "", email: customer.email ?? "", address: customer.address ?? "", customerSince: customer.customerSince ?? "", totalNumberOfOrders: customer.totalNumberOfOrders ?? "", noOfCancelOrders: Int(customer.numberOfCancelOrders), prefferedPayment: customer.prefferedPayment ?? "", customerImage: customer.customerImage ?? "")
                                                                    }
            return customerModelArr
        }catch{
            print("error fetching from db:\(error)")
            return []
        }
    }

    
    
    func saveDeliveryPartners(_ deliveryPartnerModels:[DeliveryPartnerModel]){
        for deliveryPartner in deliveryPartnerModels{
            let deliveryPartnerDb=DeliveryPartnerDB(context: context)
            deliveryPartnerDb.id=deliveryPartner.id
            deliveryPartnerDb.address=deliveryPartner.address
            deliveryPartnerDb.city=deliveryPartner.city
            deliveryPartnerDb.dob=deliveryPartner.city
            deliveryPartnerDb.userName=deliveryPartner.userName
            deliveryPartnerDb.firstName=deliveryPartner.firstName
            deliveryPartnerDb.lastName=deliveryPartner.lastName
            deliveryPartnerDb.email=deliveryPartner.email
            deliveryPartnerDb.gender=deliveryPartner.gender
            deliveryPartnerDb.noOfDelivery=Int16(deliveryPartner.noOfDelivery)
            deliveryPartnerDb.status=deliveryPartner.status
            deliveryPartnerDb.noOfPeopleGaveRatings=Int16(deliveryPartner.noOfPeopleGaveRatings)
            deliveryPartnerDb.phNO=deliveryPartner.phNO
            deliveryPartnerDb.ratings=Int16(deliveryPartner.ratings)
            deliveryPartnerDb.imageName=deliveryPartner.imageName
        }
        do{
            try context.save()
        }catch{
            print("error saving delivery Partners to db:\(error)")
        }
    }
    
    func fetchDeliveryPartners()->[DeliveryPartnerModel]{
        let fetchRequest:NSFetchRequest<DeliveryPartnerDB>=DeliveryPartnerDB.fetchRequest()
        do{
            let fetchedDeliveryPartners=try context.fetch(fetchRequest)
            let DeliveryPartnersModelArr=fetchedDeliveryPartners.map{deliveryPartner in DeliveryPartnerModel(id: deliveryPartner.id ?? "", userName: deliveryPartner.userName ?? "", firstName: deliveryPartner.firstName ?? "", lastName: deliveryPartner.lastName ?? "", dob: deliveryPartner.dob ?? "", gender: deliveryPartner.gender ?? "", phNO: deliveryPartner.phNO ?? "", email: deliveryPartner.email ?? "", city: deliveryPartner.city ?? "", address: deliveryPartner.address ?? "", noOfDelivery: Int(deliveryPartner.noOfDelivery), ratings: Int(deliveryPartner.ratings), noOfPeopleGaveRatings: Int(deliveryPartner.noOfPeopleGaveRatings), imageName: deliveryPartner.imageName ?? "", status: deliveryPartner.status ?? "")
                                                                    }
            return DeliveryPartnersModelArr
        }catch{
            print("error fetching from db:\(error)")
            return []
        }
    }

    
    
}
