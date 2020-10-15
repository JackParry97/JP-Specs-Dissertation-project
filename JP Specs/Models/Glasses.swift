//
//  Glasses.swift
//  JP Specs
//
//  Created by Jack Parry on 09/02/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import UIKit

//code adapted from Johnson 2016

struct Glasses: Product, OverlayProduct {
    let brand : String
    let model : String
    let image : UIImage
    let price : Double
    let frameColour : String
    let frameMaterial : String
    let description : String
    let shape : String
    let lensSize : String
    let bridgeSize : String
    let templeLength : String
    let modelCode : String
    let overlayImage : UIImage

    init(brand : String, model: String, image: UIImage, price: Double, frameColour: String, frameMaterial: String, description: String, shape: String, lensSize: String, bridgeSize: String, templeLength: String, modelCode: String, overlayImage: UIImage) {
        self.brand = brand
        self.model = model
        self.image = image
        self.price = price
        self.frameColour = frameColour
        self.frameMaterial = frameMaterial
        self.description = description
        self.shape = shape
        self.lensSize = lensSize
        self.bridgeSize = bridgeSize
        self.templeLength = templeLength
        self.modelCode = modelCode
        self.overlayImage = overlayImage
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
                    let frameColour = glassesObject["frameColour"] as? String,
                    let frameMaterial = glassesObject["frameMaterial"] as? String,
                    let description = glassesObject["description"] as? String,
                    let shape = glassesObject["shape"] as? String,
                    let lensSize = glassesObject["lensSize"] as? String,
                    let bridgeSize = glassesObject["bridgeSize"] as? String,
                    let templeLength = glassesObject["templeLength"] as? String,
                    let modelCode = glassesObject["modelCode"] as? String,
                    let overlayImageName = glassesObject["overlayImage"] as? String,
                    let overlayImage = UIImage(named: overlayImageName){
                    glasses.append(Glasses(brand: brand, model: model, image: image, price: price, frameColour: frameColour, frameMaterial: frameMaterial, description: description, shape: shape, lensSize: lensSize, bridgeSize: bridgeSize, templeLength: templeLength, modelCode: modelCode, overlayImage: overlayImage))
                    }
                

            }

        }
        catch {
            return glasses
        }

        return glasses
    }



//end of adapted code
}
