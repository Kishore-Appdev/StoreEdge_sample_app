//
//  Products+CoreDataProperties.swift
//  StorEdgeApp
//
//  Created by admin on 26/07/23.
//
//

import Foundation
import CoreData


extension Products {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Products> {
        return NSFetchRequest<Products>(entityName: "Products")
    }

    @NSManaged public var productName: Int32
    @NSManaged public var availableQuantity: String?
    @NSManaged public var lastUpdate: String?

}

extension Products : Identifiable {

}
