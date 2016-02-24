//
//  AddPostVC.swift
//  myHood
//
//  Created by Evan Laird on 2/24/16.
//  Copyright © 2016 Evan Laird. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController {
    
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var descriptionField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        postImage.layer.cornerRadius = postImage.frame.size.width / 2
        postImage.clipsToBounds = true 

    }

    @IBAction func makePostButtonPressed(sender: UIButton!) {
        
        
    }

    @IBAction func cancelButtonPressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func addPicButtonPressed(sender: AnyObject) {
        
        sender.setTitle("", forState: .Normal)
        
    }
    
    
}
