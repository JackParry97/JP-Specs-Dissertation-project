//
//  FirstViewController.swift
//  JP Specs
//
//  Created by Jack Parry on 12/01/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var glassesHome: UIView!
    @IBOutlet weak var sunglassesHome: UIView!
    @IBOutlet weak var accessoriesHome: UIView!
    let shoppingCart = ShoppingCart.shared

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "JPSpecs"
        
    }
    
    @IBAction func shoppingCartButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "shoppingCartSegue", sender: self)
    }
    
    @IBOutlet weak var glassesImageButton: UIImageView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func glassesTapped(_ sender: Any) {
        tabBarController?.selectedIndex = 1
    }
    @IBAction func sunglassesTapped(_ sender: Any) {
        tabBarController?.selectedIndex = 2
    }
    @IBAction func accessoriesTapped(_ sender: Any) {
        tabBarController?.selectedIndex = 3
    }
    
}

