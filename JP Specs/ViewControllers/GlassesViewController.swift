//
//  SecondViewController.swift
//  JP Specs
//
//  Created by Jack Parry on 12/01/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import UIKit

class GlassesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    let glasses = Glasses.glassesFromBundle()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.dataSource = self
        
        title = "Glasses"
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    code adapted from Johnson, 2016
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GlassesDetailsViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            destination.selectedGlasses = glasses[indexPath.row]
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return glasses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GlassesTableViewCell",
                                                 for: indexPath as IndexPath) as! GlassesTableViewCell

        let glassesRow = glasses[indexPath.row]
        
        cell.brandLabel.text = glassesRow.brand
        cell.modelLabel.text = glassesRow.model
        let price = "\(glassesRow.price)"
        cell.priceLabel.text = "£" + price + "0"
        cell.photoImageView.image = glassesRow.image
        
        return cell
    }
    
    //end of adapted code
    
}

