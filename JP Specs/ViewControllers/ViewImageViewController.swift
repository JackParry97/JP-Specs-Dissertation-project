//
//  ViewImageViewController.swift
//  JP Specs
//
//  Created by Jack Parry on 09/03/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import UIKit
import Vision

class ViewImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    let overlay = OverlayImage.shared
    let picker = UIImagePickerController()
    
    var image : UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        imageView.image = image
    }
    
    //code adapted from Holban, 2017
    
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        image = nil
    }
    
    @IBAction func tryOnButton(_ sender: UIButton) {
        var orientation : Int32 = 0
        
        switch image.imageOrientation {
            case .up:
                orientation = 1
            case .right:
                orientation = 6
            case .down:
                orientation = 3
            case .left:
                orientation = 8
            default:
                orientation = 1
        }
        
        let faceLandmarksRequest = VNDetectFaceLandmarksRequest(completionHandler: self.addOverlay)
        let requestHandler = VNImageRequestHandler(cgImage: image.cgImage!, orientation: CGImagePropertyOrientation(rawValue: UInt32(orientation))!, options: [:])
        do {
            try requestHandler.perform([faceLandmarksRequest])
        } catch {
            print("Error")
        }
    }
    
    func addOverlay(request: VNRequest, error: Error?) {
        guard let observations = request.results as? [VNFaceObservation] else {
            fatalError("unexpected result type!")
        }
        
        //end of adapted code
        
        if observations.count == 0 {
            let noFaceAlert = UIAlertController(title: "No face detected", message: "There is no face in you're photo. \n Please retake or choose another photo and click 'Try On'.", preferredStyle: UIAlertControllerStyle.actionSheet)
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                noFaceAlert.addAction(UIAlertAction(title: "Retake Photo", style: UIAlertActionStyle.default, handler: {action in
                    self.picker.sourceType = .camera
                    self.present(self.picker, animated: true, completion: nil)
                }))
            }
            noFaceAlert.addAction(UIAlertAction(title: "Choose Different Photo", style: UIAlertActionStyle.default, handler: {action in
                self.picker.sourceType = .photoLibrary
                self.present(self.picker, animated: true, completion: nil)
            }))
            noFaceAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(noFaceAlert, animated: true, completion: nil)
        } else {
            UIGraphicsBeginImageContextWithOptions(image.size, true, 0.0)
            let context = UIGraphicsGetCurrentContext()

            image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))

            context?.translateBy(x: 0, y: image.size.height)
            context?.scaleBy(x: 1.0, y: -1.0)
            context?.saveGState()

            let overlayImage : UIImage = (overlay.itemAtIndex(0)?.overlayProduct.overlayImage)!
            var overlayOrientation : Int32 = 0
            switch overlayImage.imageOrientation {
                case .up:
                    overlayOrientation = 1
                case .right:
                    overlayOrientation = 6
                case .down:
                    overlayOrientation = 3
                case .left:
                    overlayOrientation = 8
                default:
                    overlayOrientation = 1
            }
            
            let newOverlayImage = UIImage(cgImage: overlayImage.cgImage!, scale: overlayImage.scale, orientation: UIImageOrientation(rawValue: Int(overlayOrientation))!)
            
            let leftPupilInImage = observations.first?.landmarks?.leftPupil?.pointsInImage(imageSize: image.size)
            let rightPupilInImage = observations.first?.landmarks?.rightPupil?.pointsInImage(imageSize: image.size)
            
            let w = (observations.first?.boundingBox.width)! * image.size.width
            let midXInImage = (leftPupilInImage![0].x + rightPupilInImage![0].x) / 2
            let midYInImage = (leftPupilInImage![0].y + rightPupilInImage![0].y) / 2
            
            let overlayW = w * 0.9
            let oldW = overlayImage.size.width
            let scaleFactor = overlayW / oldW
            let overlayH = overlayImage.size.height * scaleFactor
            let newOverlayX = midXInImage - (overlayW / 2)
            let newOverlayY = midYInImage - (overlayH * 0.6)
            
            let overlayRect = CGRect(x: newOverlayX, y: newOverlayY, width: overlayW, height: overlayH)
            
            newOverlayImage.draw(in: overlayRect)
            context?.saveGState()
            let finalImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            imageView.image = finalImage
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated: true, completion: nil)
        image = info[UIImagePickerControllerOriginalImage] as! UIImage
    }
}
