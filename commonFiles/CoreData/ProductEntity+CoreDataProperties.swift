//
//  ProductEntity+CoreDataProperties.swift
//  StorEdgeApp
//
//  Created by admin on 27/07/23.
//
//

import Foundation
import CoreData


extension ProductEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductEntity> {
        return NSFetchRequest<ProductEntity>(entityName: "ProductEntity")
    }

    @NSManaged public var productName: String?
    @NSManaged public var availableQuantity: Int32
    @NSManaged public var lastUpdate: String?
    @NSManaged public var productImage: String?

}

extension ProductEntity : Identifiable {

}
