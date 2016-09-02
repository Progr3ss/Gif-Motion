//
//  GifEditorViewController.swift
//  Gif Motion
//
//  Created by martin chibwe on 9/1/16.
//  Copyright © 2016 Martin Chibwe. All rights reserved.
//

import UIKit

class GifEditorViewController: UIViewController {
//	@IBOutlet weak var gifImageView: UIImageView!
	
	
	@IBOutlet weak var captionTextField: UITextField!
	@IBOutlet weak var gifImageView: UIImageView!
//	var gifURL : NSURL? = nil
	var gif: Gif?

	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		gifImageView.image = gif?.gifImage
		
//		if let gifURL = gifURL{
//			
//			let gifFromRecording = UIImage.gifWithURL(String(gifURL))
////			gifImageView.image = gifFromRecording
//			gifImageView.image = gif?.gifImage
//			
//			
//		}
	}
    override func viewDidLoad() {
        super.viewDidLoad()
		

        // Do any additional setup after loading the view.
    }



}
