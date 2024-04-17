//
//  DelieryPartnerModel.swift
//  StorEdgeApp
//
//  Created by admin on 31/07/23.
//

import Foundation
class DeliveryPartnerModel{
     public var id: String
     public var userName: String
     public var firstName: String
     public var lastName: String
     public var dob: String
     public var gender: String
     public var phNO: String
     public var email: String
     public var city: String
     public var address: String
     public var noOfDelivery: Int
     public var ratings: Int
     public var noOfPeopleGaveRatings:Int
     public var imageName: String
     public var status: String
    init(id: String, userName: String, firstName: String, lastName: String, dob: String, gender: String, phNO: String, email: String, city: String, address: String, noOfDelivery: Int, ratings: Int, noOfPeopleGaveRatings: Int, imageName: String, status: String) {
        self.id = id
        self.userName = userName
        self.firstName = firstName
        self.lastName = lastName
        self.dob = dob
        self.gender = gender
        self.phNO = phNO
        self.email = email
        self.city = city
        self.address = address
        self.noOfDelivery = noOfDelivery
        self.ratings = ratings
        self.noOfPeopleGaveRatings = noOfPeopleGaveRatings
        self.imageName = imageName
        self.status = status
    }
}
