//
//  Sunglasses.swift
//  JP Specs
//
//  Created by Jack Parry on 07/02/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//
//
import UIKit

//code adapted from Johnson, 2016

struct Sunglasses: Product, OverlayProduct {
    let brand : String
    let model : String
    let image : UIImage
    var price : Double
    let frameColour : String
    let lensType : String
    let frameMaterial : String
    let description : String
    let shape : String
    let lensSize : String
    let bridgeSize : String
    let templeLength : String
    let modelCode : String
    let overlayImage : UIImage
    

    init(brand : String, model: String, image: UIImage, price: Double, frameColour: String, lensType: String, frameMaterial: String, description: String, shape: String, lensSize: String, bridgeSize: String, templeLength: String, modelCode: String, overlayImage: UIImage) {
        self.brand = brand
        self.model = model
        self.image = image
        self.price = price
        self.frameColour = frameColour
        self.lensType = lensType
        self.frameMaterial = frameMaterial
        self.description = description
        self.shape = shape
        self.lensSize = lensSize
        self.bridgeSize = bridgeSize
        self.templeLength = templeLength
        self.modelCode = modelCode
        self.overlayImage = overlayImage
    }

    static func sunglassesFromBundle() -> [Sunglasses]
    {

        var sunglasses = [Sunglasses]()

        guard let url = Bundle.main.url(forResource: "sunglasses", withExtension: "json") else {
            return sunglasses
        }

        do {

            let data = try Data(contentsOf: url)

            guard let rootObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                return sunglasses
            }

            guard let sunglassesObjects = rootObject["sunglasses"] as? [[String: AnyObject]] else {
                return sunglasses
            }

            for sunglassesObject in sunglassesObjects {
                if let brand = sunglassesObject["brand"] as? String,
                    let model = sunglassesObject["model"] as? String,
                    let imageName = sunglassesObject["image"] as? String,
                    let image = UIImage(named: imageName),
                    var price = sunglassesObject["price"] as? Double,
                    let frameColour = sunglassesObject["frameColour"] as? String,
                    let lensType = sunglassesObject["lensType"] as? String,
                    let frameMaterial = sunglassesObject["frameMaterial"] as? String,
                    let description = sunglassesObject["description"] as? String,
                    let shape = sunglassesObject["shape"] as? String,
                    let lensSize = sunglassesObject["lensSize"] as? String,
                    let bridgeSize = sunglassesObject["bridgeSize"] as? String,
                    let templeLength = sunglassesObject["templeLength"] as? String,
                    let modelCode = sunglassesObject["modelCode"] as? String,
                    let overlayImageName = sunglassesObject["overlayImage"] as? String,
                    let overlayImage = UIImage(named: overlayImageName){
                    sunglasses.append(Sunglasses(brand: brand, model: model, image: image, price: price, frameColour: frameColour, lensType: lensType, frameMaterial: frameMaterial, description: description, shape: shape, lensSize: lensSize, bridgeSize: bridgeSize, templeLength: templeLength, modelCode: modelCode, overlayImage: overlayImage))
                        }
                }

            }

        
        catch {
            return sunglasses
        }

        return sunglasses
    }

}
//end of adapted code


