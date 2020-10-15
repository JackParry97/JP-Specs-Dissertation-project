//
//  GlassesDetailsViewController.swift
//  JP Specs
//
//  Created by Jack Parry on 05/03/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import UIKit

class SunglassesDetailsViewController: UIViewController {

    var selectedSunglasses : Sunglasses!
//    let sunglasses = Sunglasses.sunglassesFromBundle()
    let overlay = OverlayImage.shared
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var modelCodeLabel: UILabel!
    @IBOutlet weak var lensesLabel: UILabel!
    @IBOutlet weak var frameColourLabel: UILabel!
    @IBOutlet weak var frameShapeLabel: UILabel!
    @IBOutlet weak var frameMaterialLabel: UILabel!
    @IBOutlet weak var lensSizeLabel: UILabel!
    @IBOutlet weak var bridgeSizeLabel: UILabel!
    @IBOutlet weak var templeLengthLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var sizeView: UIView!
    @IBOutlet weak var frameView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overlay.deleteItem()
        scrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: 375, height: 650)

        titleLabel.text = selectedSunglasses.brand + " " + selectedSunglasses.model
        photoImageView.image = selectedSunglasses.image
        let price = "\(selectedSunglasses.price)"
        priceLabel.text = "£" + price + "0"
        descriptionLabel.text = selectedSunglasses.description
        modelCodeLabel.text = selectedSunglasses.modelCode
        lensesLabel.text = selectedSunglasses.lensType
        frameColourLabel.text = selectedSunglasses.frameColour
        frameShapeLabel.text = selectedSunglasses.shape
        frameMaterialLabel.text = selectedSunglasses.frameMaterial
        lensSizeLabel.text = selectedSunglasses.lensSize
        bridgeSizeLabel.text = selectedSunglasses.bridgeSize
        templeLengthLabel.text = selectedSunglasses.templeLength
        
        segmentedControl.frame = CGRect(x: segmentedControl.frame.origin.x, y: segmentedControl.frame.origin.y, width: segmentedControl.frame.size.width, height: 40);
        
        descriptionView.isHidden = false
        frameView.isHidden = true
        sizeView.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sunglassesAddToCart" {
            let destination = segue.destination as! SunglassesPrescriptionViewController
            destination.sunglasses = selectedSunglasses
        }
    }
    
    @IBAction func viewSunglassesTapped(_ sender: Any) {
        overlay.deleteItem()
        let item = OverlayItem(overlayProduct: selectedSunglasses)
        overlay.addItem(item)
    }
    
    @IBAction func segmentedControlPressed(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            descriptionView.isHidden = false
            frameView.isHidden = true
            sizeView.isHidden = true
        case 1:
            descriptionView.isHidden = true
            frameView.isHidden = false
            sizeView.isHidden = true
        case 2:
            descriptionView.isHidden = true
            frameView.isHidden = true
            sizeView.isHidden = false
        default:
            break
        }
    }
    
}
