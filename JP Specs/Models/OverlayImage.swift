//
//  Overlay.swift
//  JP Specs
//
//  Created by Jack Parry on 08/03/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import UIKit

class OverlayImage {
    
    static let shared = OverlayImage()
    
    private init() {
        
    }
    
    private var overlayItem = [OverlayItem]()

    func itemAtIndex(_ index: Int) -> OverlayItem? {
        return overlayItem[index]
    }
    
    func addItem(_ item: OverlayItem){
        overlayItem.append(item)
    }
    
    func deleteItem() {
        overlayItem.removeAll()
    }
}
