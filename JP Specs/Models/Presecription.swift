//
//  Presecription.swift
//  JP Specs
//
//  Created by Jack Parry on 02/03/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import UIKit

struct Presecription {
    
    init(left: Int, right: Int, polarized: Bool) {
        self.left = left
        self.right = right
        self.polarized = polarized
    }

    var left : Int
    var right : Int
    var polarized : Bool
}
