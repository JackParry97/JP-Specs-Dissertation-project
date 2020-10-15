//
//  Product.swift
//  JP Specs
//
//  Created by Jack Parry on 06/03/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import UIKit

protocol Product {
    var brand : String {get}
    var model : String {get}
    var image : UIImage {get}
    var price : Double {get}
}

