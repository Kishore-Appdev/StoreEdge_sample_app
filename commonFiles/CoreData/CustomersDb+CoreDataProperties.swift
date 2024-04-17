//
//  CustomersDb+CoreDataProperties.swift
//  StorEdgeApp
//
//  Created by admin on 02/08/23.
//
//

import Foundation
import CoreData


extension CustomersDb {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CustomersDb> {
        return NSFetchRequest<CustomersDb>(entityName: "CustomersDb")
    }

    @NSManaged public var address: String?
    @NSManaged public var customerImage: String?
    @NSManaged public var customerSince: String?
    @NSManaged public var dateOfBirth: String?
    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var fullName: String?
    @NSManaged public var gender: String?
    @NSManaged public var lastName: String?
    @NSManaged public var numberOfCancelOrders: Int32
    @NSManaged public var phoneNumber: String?
    @NSManaged public var prefferedPayment: String?
    @NSManaged public var totalNumberOfOrders: String?

}

extension CustomersDb : Identifiable {

}
