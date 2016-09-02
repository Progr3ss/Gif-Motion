//
//  ViewController.swift
//  Gif Motion
//
//  Created by martin chibwe on 8/31/16.
//  Copyright © 2016 Martin Chibwe. All rights reserved.
//

import UIKit
import Foundation
import MobileCoreServices


//RegifConstants
let frameCount = 16
let delayTime: Float =  0.2
let loopCount = 0 // 0 means loop forever 


class ViewController: UIViewController {

	
	@IBOutlet weak var gifImageView: UIImageView!
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		let proofOfConceptGif = UIImage.gifWithName("hotlineBling")
		gifImageView.image = proofOfConceptGif
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		

        // Do any additional setup after loading the view.
    }



	@IBAction func launchVideoCamera(sender: AnyObject) {
		
		let recordVideoController = UIImagePickerController()
		recordVideoController.sourceType = UIImagePickerControllerSourceType.Camera
		recordVideoController.mediaTypes = [kUTTypeMovie as String]
		recordVideoController.allowsEditing = false
		recordVideoController.delegate = self
		
		presentViewController(recordVideoController, animated: true, completion: nil)
	}
	


}

extension UIViewController: UIImagePickerControllerDelegate{
	
	public func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
		
		let videoURL = info[UIImagePickerControllerMediaURL] as! NSURL
		convertVideoToGIF(videoURL)
//		UISaveVideoAtPathToSavedPhotosAlbum(videoURL.path!, nil, nil, nil)
		
		dismissViewControllerAnimated(true, completion: nil)
		
	}
	
	public func imagePickerControllerDidCancel(picker: UIImagePickerController) {
		
		
	}
	
	func convertVideoToGIF(videoURL:NSURL){
		let regift = Regift(sourceFileURL: videoURL, destinationFileURL:nil, frameCount: frameCount, delayTime: delayTime, loopCount: loopCount)
		let gifURL = regift.createGif()
		
		let gif = Gif(url: gifURL!, videoURL: videoURL, caption: nil)
		
		displayGIF(gif)
	}
	func displayGIF(gif:Gif)  {
		let gifEditorVC =
		storyboard?.instantiateViewControllerWithIdentifier("GifEditorViewController") as! GifEditorViewController
		gifEditorVC.gif = gif
		navigationController?.pushViewController(gifEditorVC, animated: true)
	}
}

extension UIViewController:UINavigationControllerDelegate{
	
}
