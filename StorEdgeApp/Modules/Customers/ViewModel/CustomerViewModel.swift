//
//  CustomerViewModel.swift
//  StorEdgeApp
//
//  Created by admin on 27/07/23.
//

import Foundation

class CustomerViewModel{
    var customers:[CustomerModel]=[
        CustomerModel(firstName: "John", lastName: "Doe", fullName: "John Doe", dateOfBirth: "06.06.1989", gender: "Male", phoneNumber: "(212) 555-1234", email: "jhdoe13@gmail", address: "NewYork", customerSince: "09.11.2022", totalNumberOfOrders: "134 Times", noOfCancelOrders: 2, prefferedPayment: "ApplePay", customerImage: "CustomerImage"),
        CustomerModel(firstName: "Jane", lastName: "Smith", fullName: "Jane Smith", dateOfBirth: "06.06.1989", gender: "Male", phoneNumber: "(212) 555-1234", email: "jhdoe13@gmail", address: "NewYork", customerSince: "09.11.2022", totalNumberOfOrders: "134 Times", noOfCancelOrders: 2, prefferedPayment: "ApplePay", customerImage: "CustomerImage"),
        CustomerModel(firstName: "Sam", lastName: "Wilson", fullName: "Sam Wilson", dateOfBirth: "06.06.1989", gender: "Male", phoneNumber: "(212) 555-1234", email: "jhdoe13@gmail", address: "NewYork", customerSince: "09.11.2022", totalNumberOfOrders: "134 Times", noOfCancelOrders: 2, prefferedPayment: "ApplePay", customerImage: "CustomerImage"),
        CustomerModel(firstName: "Emily", lastName: "Jones", fullName: "Emily Jones", dateOfBirth: "06.06.1989", gender: "Male", phoneNumber: "(212) 555-1234", email: "jhdoe13@gmail", address: "NewYork", customerSince: "09.11.2022", totalNumberOfOrders: "134 Times", noOfCancelOrders: 2, prefferedPayment: "ApplePay", customerImage: "CustomerImage"),
        CustomerModel(firstName: "James", lastName: "Davis", fullName: "James Davis", dateOfBirth: "06.06.1989", gender: "Male", phoneNumber: "(212) 555-1234", email: "jhdoe13@gmail", address: "NewYork", customerSince: "09.11.2022", totalNumberOfOrders: "134 Times", noOfCancelOrders: 2, prefferedPayment: "ApplePay", customerImage: "CustomerImage"),
        CustomerModel(firstName: "Sophia", lastName: "John", fullName: "Sophia John", dateOfBirth: "06.06.1989", gender: "Male", phoneNumber: "(212) 555-1234", email: "jhdoe13@gmail", address: "NewYork", customerSince: "09.11.2022", totalNumberOfOrders: "134 Times", noOfCancelOrders: 2, prefferedPayment: "ApplePay", customerImage: "CustomerImage"),
        CustomerModel(firstName: "Noah", lastName: "Williams", fullName: "Noah Williams", dateOfBirth: "06.06.1989", gender: "Male", phoneNumber: "(212) 555-1234", email: "jhdoe13@gmail", address: "NewYork", customerSince: "09.11.2022", totalNumberOfOrders: "134 Times", noOfCancelOrders: 2, prefferedPayment: "ApplePay", customerImage: "CustomerImage"),
        CustomerModel(firstName: "Ava", lastName: "Miller", fullName: "Ava Miller", dateOfBirth: "06.06.1989", gender: "Male", phoneNumber: "(212) 555-1234", email: "jhdoe13@gmail", address: "NewYork", customerSince: "09.11.2022", totalNumberOfOrders: "134 Times", noOfCancelOrders: 2, prefferedPayment: "ApplePay", customerImage: "CustomerImage")]
    
    func customerSave(){
        DataBaseHelper.shareInstance.saveCustomers(customers)
   }
    func customersFetchFromDB()->[CustomerModel]{
      DataBaseHelper.shareInstance.fetchCustomers()
   }
    
}
