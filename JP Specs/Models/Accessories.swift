//
//  Accessories.swift
//  JP Specs
//
//  Created by Jack Parry on 23/02/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import UIKit

//code adapted from Johnson, 2016
struct Accessories: Product {
    let brand : String
    let model : String
    let image : UIImage
    let price : Double
    let description : String
    
    init(make: String, product: String, image: UIImage, price: Double, description: String) {
        self.brand = make
        self.model = product
        self.image = image
        self.price = price
        self.description = description
    }
    
    static func accessoriesFromBundle() -> [Accessories] {
        
        var accessories = [Accessories]()
        
        guard let url = Bundle.main.url(forResource: "accessories", withExtension: "json") else {
            return accessories
        }
        
        do {
            let data = try Data(contentsOf: url)
            guard let rootObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                return accessories
            }
            
            guard let accessoriesObjects = rootObject["accessories"] as? [[String: AnyObject]] else {
                return accessories
            }
            
            for accessoriesObject in accessoriesObjects {
                if let make = accessoriesObject["make"] as? String,
                    let product = accessoriesObject["product"] as? String,
                    let imageName = accessoriesObject["image"] as? String,
                    let image = UIImage(named: imageName),
                    let price = accessoriesObject["price"] as? Double,
                    let description = accessoriesObject["description"] as? String
                {
                    accessories.append(Accessories(make: make, product: product, image: image, price: price, description: description))
                }
                
                }
            }
        catch {
            return accessories
        }
        return accessories
        }
}
//end of adapted code
