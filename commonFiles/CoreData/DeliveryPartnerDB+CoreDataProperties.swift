//
//  DeliveryPartnerDB+CoreDataProperties.swift
//  StorEdgeApp
//
//  Created by admin on 31/07/23.
//
//

import Foundation
import CoreData


extension DeliveryPartnerDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DeliveryPartnerDB> {
        return NSFetchRequest<DeliveryPartnerDB>(entityName: "DeliveryPartnerDB")
    }

    @NSManaged public var id: String?
    @NSManaged public var userName: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var dob: String?
    @NSManaged public var gender: String?
    @NSManaged public var phNO: String?
    @NSManaged public var email: String?
    @NSManaged public var city: String?
    @NSManaged public var address: String?
    @NSManaged public var noOfDelivery: Int16
    @NSManaged public var ratings: Int16
    @NSManaged public var noOfPeopleGaveRatings: Int16
    @NSManaged public var imageName: String?
    @NSManaged public var status: String?

}

extension DeliveryPartnerDB : Identifiable {

}
