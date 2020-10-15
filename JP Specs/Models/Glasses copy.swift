//
//  Glasses.swift
//  JP Specs
//
//  Created by Jack Parry on 09/02/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import UIKit

//code adapted from Razeware LLC 2016

struct Glasses {
    let brand : String
    let model : String
    let image : UIImage
    let price : Double
    let productDetail : [productDetails]

    init(brand : String, model: String, image: UIImage, price: Double, productDetail: [productDetails]) {
        self.brand = brand
        self.model = model
        self.image = image
        self.price = price
        self.productDetail = productDetail
    }


    static func glassesFromBundle() -> [Glasses]{

        var glasses = [Glasses]()

        guard let url = Bundle.main.url(forResource: "glasses", withExtension: "json") else {
            return glasses
        }

        do {

            let data = try Data(contentsOf: url)
            guard let rootObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                return glasses
            }

            guard let glassesObjects = rootObject["glasses"] as? [[String: AnyObject]] else {
                return glasses
            }

            for glassesObject in glassesObjects {
                if let brand = glassesObject["brand"] as? String,
                    let model = glassesObject["model"] as? String,
                    let imageName = glassesObject["image"] as? String,
                    let image = UIImage(named: imageName),
                    let price = glassesObject["price"] as? Double,
                    let detailsObjects = glassesObject["productDetails"] as? [[String: String]] {
                    var productDetail = [productDetails]()
                    for detailsObject in detailsObjects {
                        if let detailsImageName = detailsObject["image"],
                            let detailImage = UIImage(named : detailsImageName + ".jpg"),
                            let detailFrameColour = detailsObject["frameColour"],
                            let detailLensType = detailsObject["lensType"],
                            let detailFrameMaterial = detailsObject["frameMaterial"],
                            let detailPrice = detailsObject["price"],
                            let detailDescription = detailsObject["description"],
                            let detailShape = detailsObject["shape"],
                            let detailSizeLensBridge = detailsObject["sizeLensBridge"],
                            let detailTempleLength = detailsObject["templeLength"] {
                            productDetail.append(productDetails(brand: brand, model: model, image: detailImage, frameColour: detailFrameColour, lensType: detailLensType, frameMaterial: detailFrameMaterial, price: detailPrice, description: detailDescription, shape: detailShape, sizeLensBridge: detailSizeLensBridge, templeLength: detailTempleLength))
                        }

                    }
                    let glassesAppend = Glasses(brand: brand, model: model, image: image, price: price, productDetail: productDetail)
                    glasses.append(glassesAppend)
                }

            }

        }
        catch {
            return glasses
        }

        return glasses
    }

}

//end of adapted code
