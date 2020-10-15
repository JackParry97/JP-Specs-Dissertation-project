//
//  AccessoriesDetailsViewController.swift
//  JP Specs
//
//  Created by Jack Parry on 08/03/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import UIKit

class AccessoriesDetailsViewController: UIViewController {
    
    var selectedAccessories : Accessories!
//    let accessories = Accessories.accessoriesFromBundle()
    let shoppingCart = ShoppingCart.shared
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text  = selectedAccessories.brand + selectedAccessories.model
        photoImageView.image = selectedAccessories.image
        let price = "\(selectedAccessories.price)"
        priceLabel.text = "£" + price + "0"
        descriptionLabel.text = selectedAccessories.description
    }

    @IBAction func addToCartButton(_ sender: Any) {
        let prescription = Presecription(left: 0, right: 0, polarized: false)
        let item = OrderItem(product: selectedAccessories, prescription: prescription)
        shoppingCart.addItem(item)
        
        let itemAddedAlert = UIAlertController(title: "Item Added", message: "Your chosen item has been added to the shopping cart." , preferredStyle: UIAlertControllerStyle.actionSheet)
        itemAddedAlert.addAction(UIAlertAction(title: "Continue to Shopping Cart", style: UIAlertActionStyle.default, handler: { action in
            self.performSegue(withIdentifier: "toCartSegue", sender: self)
        }))
        itemAddedAlert.addAction(UIAlertAction(title: "Continue Browsing", style: UIAlertActionStyle.default, handler: { action in
            _ = self.navigationController?.popToRootViewController(animated: true)
        }))
        self.present(itemAddedAlert, animated: true, completion: nil)
    }
    

}
