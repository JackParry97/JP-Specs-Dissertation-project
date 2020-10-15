//
//  OverlayItem.swift
//  JP Specs
//
//  Created by Jack Parry on 08/03/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import UIKit

class OverlayItem: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(overlayProduct, forKey: "op")
    }
    
    required init?(coder aDecoder: NSCoder) {
        overlayProduct = aDecoder.decodeObject(forKey: "op") as! Glasses
    }
    
    init(overlayProduct: OverlayProduct) {
        self.overlayProduct = overlayProduct
    }
    
    var overlayProduct : OverlayProduct
}
