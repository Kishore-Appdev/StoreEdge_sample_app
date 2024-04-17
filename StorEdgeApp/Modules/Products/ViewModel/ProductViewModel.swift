//
//  ProductViewModel.swift
//  StorEdgeApp
//
//  Created by admin on 26/07/23.
//

import Foundation
class ProductViewModel{
    var products:[ProductModel]=[
        ProductModel(productName: "Zesty Chicken Wrap", avilableQuantity: 32, lastUpdate: "12 jun 23|17:34", productImage: "Zesty"),
        ProductModel(productName: "BBQ Becon Burger", avilableQuantity: 56, lastUpdate: "12 jun 23|17:34", productImage: "BBQ"),
        ProductModel(productName: "South West Salad Bowl", avilableQuantity: 2, lastUpdate: "12 jun 23|17:34", productImage: "Southwest"),
        ProductModel(productName: "Cheesy Garlic Breadsticks", avilableQuantity: 2, lastUpdate: "12 jun 23|17:34", productImage: "ChessyGarlic"),
        ProductModel(productName: "Grilled Veggie Panini", avilableQuantity: 0, lastUpdate: "12 jun 23|17:34", productImage: "GrilledVeggie"),
        ProductModel(productName: "Crispy Fish Tacos", avilableQuantity: 10, lastUpdate: "12 jun 23|17:34", productImage:"CrispyFish" ),
        ProductModel(productName: "Bacon Ranch Fries", avilableQuantity: 10, lastUpdate: "12 jun 23|17:34", productImage: "Bacon"),
        ProductModel(productName: "Chicken Wings", avilableQuantity: 10, lastUpdate: "12 jun 23|17:34", productImage: "ChickenWings"),
        ProductModel(productName: "Veggie Lovers Pizza", avilableQuantity: 0, lastUpdate: "12 jun 23|17:34", productImage: "VeggieLoverPizza"),
        ProductModel(productName: "Choconut Sundae", avilableQuantity: 5, lastUpdate: "12 jun 23|17:34", productImage: "Choconut"),
    ]
  
    
     func productsSave(){
        DataBaseHelper.shareInstance.saveProducts(products)
    }
     func productsFetchFromDB()->[ProductModel]{
         DataBaseHelper.shareInstance.fetchProducts().sorted{$0.productName<$1.productName}
    }
}
