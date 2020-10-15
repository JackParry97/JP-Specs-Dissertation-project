//
//  FaceVision.swift
//  JP Specs
//
//  Created by Jack Parry on 09/03/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import UIKit

class TakePhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var takePhotoButton: UIButton!
    var image : UIImage!
    @IBOutlet weak var photoImageView: UIImageView!
    
    let overlay = OverlayImage.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoImageView.image = overlay.itemAtIndex(0)?.overlayProduct.overlayImage
    }
    
    //Code adapted from Holban, 2017
    
    @IBAction func takePhoto(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        let takePhotoAlert = UIAlertController(title: nil, message: "Choose 'Camera' to take a new photo \n - or - \n Choose 'Photo Library' to choose a photo from your library", preferredStyle: .actionSheet)
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            takePhotoAlert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
                picker.sourceType = .camera
                self.present(picker, animated: true, completion: nil)
            }))
        }
        
        takePhotoAlert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {action in
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)
        }))
        
        takePhotoAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(takePhotoAlert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated: true, completion: nil)
        image = info[UIImagePickerControllerOriginalImage] as! UIImage
        performSegue(withIdentifier: "showImageSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showImageSegue" {
            if let imageViewController = segue.destination as? ViewImageViewController {
                imageViewController.image = self.image
            }
        }
    }
    //End of adapted code
    
    
    @IBAction func cancelButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
}
