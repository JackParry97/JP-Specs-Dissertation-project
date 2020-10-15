//
//  GlassesPerscriptionViewController.swift
//  JP Specs
//
//  Created by Jack Parry on 27/02/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import UIKit

class GlassesPrescriptionViewController: UIViewController {
    
    var glasses : Glasses!
    var shoppingCart = ShoppingCart.shared
    
    @IBOutlet weak var leftPrescriptionText: UITextField!
    @IBOutlet weak var leftPrescriptionStepper: UIStepper!
    @IBOutlet weak var rightPrescriptionText: UITextField!
    @IBOutlet weak var rightPrescriptionStepper: UIStepper!
    
    @IBAction func addToCartButton(_ sender: Any) {
        var leftPrescriptionValue = 0
        var rightPrescriptionValue = 0
        leftPrescriptionValue = Int(leftPrescriptionText.text!)!
        rightPrescriptionValue = Int(rightPrescriptionText.text!)!
        let prescription = Presecription(left: leftPrescriptionValue, right: rightPrescriptionValue, polarized: false)
        let item = OrderItem(product: glasses, prescription: prescription)
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
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func leftValueChanged(_ sender: UIStepper) {
        leftPrescriptionText.text = Int(sender.value).description
    }
    
    @IBAction func rightValueChanged(_ sender: UIStepper) {
        rightPrescriptionText.text = Int(sender.value).description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        leftPrescriptionStepper.wraps = true
        leftPrescriptionStepper.autorepeat = true
        leftPrescriptionStepper.maximumValue = 10
        leftPrescriptionStepper.minimumValue = -10
        leftPrescriptionStepper.stepValue = 1
        rightPrescriptionStepper.wraps = true
        rightPrescriptionStepper.autorepeat = true
        rightPrescriptionStepper.maximumValue = 10
        rightPrescriptionStepper.minimumValue = -10
        rightPrescriptionStepper.stepValue = 1
    }
    

}
