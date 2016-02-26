//
//  AddPostVC.swift
//  myHood
//
//  Created by Evan Laird on 2/24/16.
//  Copyright © 2016 Evan Laird. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var descriptionField: UITextField!
    
    var imagePicker: UIImagePickerController!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        postImage.layer.cornerRadius = postImage.frame.size.width / 2
        postImage.clipsToBounds = true
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        self.titleField.delegate = self
        self.descriptionField.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    //Keyboard Functions
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            self.view.frame.origin.y -= keyboardSize.height
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            self.view.frame.origin.y += keyboardSize.height
    }
    }
    
    
    //Doing stuff functions
    
    
    @IBAction func makePostButtonPressed(sender:AnyObject) {
        
        if let title = titleField.text, let desc = descriptionField.text, let img = postImage.image {
            
            let imagePath = DataService.instance.saveImageAndCreatePath(img)
            
            let post = Post(imagePath: imagePath, title: title, desc: desc)
            DataService.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
            
        }
        
        
    }

    @IBAction func cancelButtonPressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func addPicButtonPressed(sender: AnyObject) {
        
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        postImage.image = image
    }
    
    
}
