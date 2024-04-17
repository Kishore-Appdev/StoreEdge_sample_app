//
//  CustomerModel.swift
//  StorEdgeApp
//
//  Created by admin on 27/07/23.
//

import Foundation

class CustomerModel{
    var firstName:String
    var lastName:String
    var fullName:String
    var dateOfBirth:String
    var gender:String
    var phoneNumber:String
    var email:String
    var address:String
    var customerSince:String
    var totalNumberOfOrders:String
    var noOfCancelOrders:Int
    var prefferedPayment:String
    var customerImage:String
    
    init(firstName: String, lastName: String, fullName: String, dateOfBirth: String, gender: String, phoneNumber: String, email: String, address: String, customerSince: String, totalNumberOfOrders: String, noOfCancelOrders: Int, prefferedPayment: String, customerImage:String) {
        self.firstName = firstName
        self.lastName = lastName
        self.fullName = fullName
        self.dateOfBirth = dateOfBirth
        self.gender = gender
        self.phoneNumber = phoneNumber
        self.email = email
        self.address = address
        self.customerSince = customerSince
        self.totalNumberOfOrders = totalNumberOfOrders
        self.noOfCancelOrders = noOfCancelOrders
        self.prefferedPayment = prefferedPayment
        self.customerImage=customerImage
    }
    
}
