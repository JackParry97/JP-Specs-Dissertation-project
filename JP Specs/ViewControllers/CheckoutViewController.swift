//
//  CheckoutViewController.swift
//  JP Specs
//
//  Created by Jack Parry on 01/03/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    let shoppingCart = ShoppingCart.shared
    
    @IBAction func checkoutButton(_ sender: Any) {
        _ = self.navigationController?.popToRootViewController(animated: true)
        self.shoppingCart.removeAllItems()
        self.tabBarController?.selectedIndex = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: 375, height: 703)
        
        let finalPrice = shoppingCart.calculateTotalPrice()
        
        totalPriceLabel.text = "£" + "\(finalPrice)" + "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


