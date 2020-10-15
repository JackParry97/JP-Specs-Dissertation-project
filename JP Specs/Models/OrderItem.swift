//
//  OrderItem.swift
//  JP Specs
//
//  Created by Jack Parry on 02/03/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import UIKit

class OrderItem: NSObject, NSCoding {
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(product, forKey: "p")
        aCoder.encode(prescription, forKey: "pre")
    }
    
    required init?(coder aDecoder: NSCoder) {
        product = aDecoder.decodeObject(forKey: "p") as! Glasses
        prescription = aDecoder.decodeObject(forKey: "pre") as! Presecription
    }
    
    init(product: Product, prescription: Presecription) {
        self.product = product
        self.prescription = prescription
    }
    
    var product : Product
    var prescription : Presecription
}
