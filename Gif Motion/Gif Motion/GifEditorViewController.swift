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

	var gif: Gif?

	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		gifImageView.image = gif?.gifImage

	}
    override func viewDidLoad() {
        super.viewDidLoad()
		
    }



}
extension GifEditorViewController: UITextFieldDelegate {
	func textFieldDidBeginEditing(textField: UITextField) {
		textField.placeholder = ""
	}
	
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}

// Methods to adjust the keyboard
extension GifEditorViewController {
	func subscribeToKeyboardNotifications() {
		NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(GifEditorViewController.keyboardWillShow(_:)),
		                                                 name: UIKeyboardWillShowNotification,
		                                                 object: nil)
		NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(GifEditorViewController.keyboardWillHide(_:)),
		                                                 name: UIKeyboardWillHideNotification,
		                                                 object: nil)
	}
	
	func unsubscribeFromKeyboardNotifications() {
		NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
		NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
	}
	
	func keyboardWillShow(notification: NSNotification) {
		if view.frame.origin.y >= 0 {
			view.frame.origin.y -= getKeyboardHeight(notification)
		}
	}
	
	func keyboardWillHide(notification: NSNotification) {
		if (self.view.frame.origin.y < 0) {
			view.frame.origin.y += getKeyboardHeight(notification)
		}
	}
	
	func getKeyboardHeight(notification: NSNotification) -> CGFloat {
		let userInfo = notification.userInfo
		let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
		return keyboardSize.CGRectValue().height
	}
}

