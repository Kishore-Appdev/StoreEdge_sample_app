//
//  ProductModel.swift
//  StorEdgeApp
//
//  Created by admin on 26/07/23.
//

import Foundation

class ProductModel{
 
    
    var productName:String
    var avilableQuantity:Int
    var lastUpdate:String
    var productImage:String
    init(productName: String, avilableQuantity: Int, lastUpdate: String,productImage:String) {
        self.productName = productName
        self.avilableQuantity = avilableQuantity
        self.lastUpdate = lastUpdate
        self.productImage=productImage
    }
}
