//
//  ShoppingCart.swift
//  JP Specs
//
//  Created by Jack Parry on 26/02/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import UIKit

class ShoppingCart {
    
    static let shared = ShoppingCart()
    
    private init() {
        
    }
    
    private var items = [OrderItem]()
    
    func itemCount() -> Int{
        return items.count
    }
    
    func itemAtIndex(_ index: Int) -> OrderItem? {
        return items[index]
    }
    
    func addItem(_ item: OrderItem){
        items.append(item)
    }
    
    func removeCurrentItem(_ index: Int) {
        items.remove(at: index)
    }
    
    func removeAllItems() {
        items.removeAll()
    }
    
    func calculateTotalPrice() -> Double {
        var totalPrice : Double = 0
        for items in items {
            totalPrice += items.product.price
        }
        return totalPrice
    }
    
}
