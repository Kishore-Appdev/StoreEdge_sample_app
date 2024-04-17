//
//  DeliveryPartnerViewModel.swift
//  StorEdgeApp
//
//  Created by admin on 31/07/23.
//

import Foundation
class DeliveryPartnerViewModel{
    var deliveryPartnersData:[DeliveryPartnerModel]=[DeliveryPartnerModel(id: "123", userName: "Nirmal Azalea", firstName: "NIrmal", lastName: "Azalea", dob: "11.06.1994", gender: "Male", phNO: "+1 897 428 291", email: "nazaq@gmail.com", city: "NewYork", address: "NY City", noOfDelivery: 2382, ratings: 4, noOfPeopleGaveRatings: 1451, imageName: "Nirmal", status: "Available"),
                                                     DeliveryPartnerModel(id: "45632213", userName: "Princy George", firstName: "Princy", lastName: "George", dob: "11.06.1994", gender: "FeMale", phNO: "+1 897 428 291", email: "Princy@gmail.com", city: "NewYork", address: "NY City", noOfDelivery: 2382, ratings: 5, noOfPeopleGaveRatings: 1251, imageName: "Princy", status: "NotAvailable"),
                                                     DeliveryPartnerModel(id: "8759799", userName: "Ganesh Venkat", firstName: "Ganesh", lastName: "Venkat", dob: "11.06.1994", gender: "Male", phNO: "+1 897 428 291", email: "ganesh@gmail.com", city: "NewYork", address: "NY City", noOfDelivery: 2382, ratings: 4, noOfPeopleGaveRatings: 1451, imageName: "Ganesh", status: "Engaged")]
    
    var fetchedDeliveryPartnersArr:[DeliveryPartnerModel]{
       return DataBaseHelper.shareInstance.fetchDeliveryPartners()
    }
    
    func saveDeliveryPatnersToDb(){
        DataBaseHelper.shareInstance.saveDeliveryPartners(deliveryPartnersData)
    }
    func fetchDeliveryPartnersFromDb()->[DeliveryPartnerModel]{
        DataBaseHelper.shareInstance.fetchDeliveryPartners()
    }
}
