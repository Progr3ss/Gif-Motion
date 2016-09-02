//
//  GIF.swift
//  Gif Motion
//
//  Created by martin chibwe on 9/1/16.
//  Copyright © 2016 Martin Chibwe. All rights reserved.
//

import UIKit


class Gif {
	var url: NSURL!
	var videoURL: NSURL!
	var caption : String?
	var gifImage: UIImage?
	var gifData: NSData?
	
	init(url: NSURL, videoURL: NSURL, caption: String?) {
		self.url = url
		self.videoURL = videoURL
		self.caption = caption
		self.gifImage = UIImage.gifWithURL(url.absoluteString)!
		self.gifData = nil
		
	}
	
	init(name: String){
		self.gifImage = UIImage.gifWithName(name)
		
	}

}


