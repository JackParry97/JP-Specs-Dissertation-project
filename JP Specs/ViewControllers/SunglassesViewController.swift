//
//  SunglassesViewController.swift
//  JP Specs
//
//  Created by Jack Parry on 15/01/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import UIKit

class SunglassesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let sunglasses = Sunglasses.sunglassesFromBundle()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.dataSource = self
        
        title = "Sunglasses"
    }

    //    code adapted from Johnson, 2016

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SunglassesDetailsViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            destination.selectedSunglasses = sunglasses[indexPath.row]
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sunglasses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SunglassesTableViewCell",
                                                 for: indexPath as IndexPath) as! SunglassesTableViewCell

        let sunglassesRow = sunglasses[indexPath.row]
        cell.brandLabel.text = sunglassesRow.brand
        cell.modelLabel.text = sunglassesRow.model
        let price = "\(sunglassesRow.price)"
        cell.priceLabel.text = "£" + price + "0"
        cell.photoImageView.image = sunglassesRow.image
        return cell
    }

    //end of adapted code

   

}





