//
//  ShoppingCartViewController.swift
//  JP Specs
//
//  Created by Jack Parry on 28/02/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var shoppingCartTableView: UITableView!
    
    let shoppingCart = ShoppingCart.shared
    var totalPrice = 0
    
    fileprivate func updatePrice() {
        let price = "\(shoppingCart.calculateTotalPrice())"
        totalPriceLabel.text = "£" + price + "0"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Shopping Cart"
        
        shoppingCartTableView.dataSource = self
        
        updatePrice()
        
        var theControllers = [UIViewController]()
        theControllers.append(self.navigationController!.viewControllers.first!)
        theControllers.append(self.navigationController!.viewControllers.last!)
        self.navigationController?.setViewControllers(theControllers, animated: false)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingCart.itemCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCartTableViewCell",
                                                 for: indexPath as IndexPath) as! ShoppingCartTableViewCell
        
        cell.photoImageView.image = shoppingCart.itemAtIndex(indexPath.row)?.product.image
        cell.makeLabel.text = shoppingCart.itemAtIndex(indexPath.row)?.product.brand
        cell.modelLabel.text = shoppingCart.itemAtIndex(indexPath.row)?.product.model
        let price = "\(shoppingCart.itemAtIndex(indexPath.row)!.product.price)"
        cell.priceLabel.text = "£" + price + "0"
        let lpValue = "\(shoppingCart.itemAtIndex(indexPath.row)!.prescription.left)"
        let rpValue = "\(shoppingCart.itemAtIndex(indexPath.row)!.prescription.right)"
        if lpValue == "0" {
            cell.lpLabel.text = ""
        } else {
            cell.lpLabel.text = "Left: " + lpValue
        }
        
        if rpValue == "0" {
            cell.rpLabel.text = ""
        }else {
            cell.rpLabel.text = "Right: " + rpValue
        }
        
        if shoppingCart.itemAtIndex(indexPath.row)?.prescription.polarized == true {
            cell.polarizedLabel.text = "inc Polarized"
        } else {
            cell.polarizedLabel.text = ""
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            shoppingCart.removeCurrentItem(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            updatePrice()
        }
    }
    
    @IBAction func checkoutButtonTapped(_ sender: Any) {
        if shoppingCart.itemCount() > 0 {
            performSegue(withIdentifier: "checkoutSegue", sender: self)
        }else if shoppingCart.itemCount() == 0 {
            let noItemsAlert = UIAlertController(title: "No Items in Shopping Cart", message: "There must be items in Shopping Cart before proceeding to checkout", preferredStyle: UIAlertControllerStyle.actionSheet)
            noItemsAlert.addAction(UIAlertAction(title: "Return to Browsing", style: UIAlertActionStyle.default, handler: {action in
                _ = self.navigationController?.popToRootViewController(animated: true)
            }))
            noItemsAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(noItemsAlert, animated: true, completion: nil)
        }
    }
}
