//
//  AccessoriesViewController.swift
//  JP Specs
//
//  Created by Jack Parry on 23/02/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import UIKit

class AccessoriesViewController: UIViewController, UITableViewDataSource {

    
    @IBOutlet weak var accessoriesTableView: UITableView!
    
    let accessories = Accessories.accessoriesFromBundle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.rowHeight = UITableViewAutomaticDimension
        
        accessoriesTableView.dataSource = self
    }
    
    //code adapted from Johnson, 2016
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AccessoriesDetailsViewController,
            let indexPath = accessoriesTableView.indexPathForSelectedRow {
            destination.selectedAccessories = accessories[indexPath.row]
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accessories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccessoryTableViewCell",
                                                 for: indexPath as IndexPath) as! AccessoryTableViewCell
        
        let accessoriesRow = accessories[indexPath.row]
        cell.makeLabel.text = accessoriesRow.brand
        cell.productLabel.text = accessoriesRow.model
        let price = "\(accessoriesRow.price)"
        cell.priceLabel.text = "£" + price + "0"
        cell.photoImageView.image = accessoriesRow.image
        return cell
    }
    //end of adapted code

}
