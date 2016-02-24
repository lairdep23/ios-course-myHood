//
//  ViewController.swift
//  myHood
//
//  Created by Evan Laird on 2/24/16.
//  Copyright © 2016 Evan Laird. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        var post = Post(imagePath: "", title: "Post 1", description: "Post 1 description.")
        var post2 = Post(imagePath: "", title: "Post 2", description: "This post has no significance whatsoever so just ignore it. But if you can't suck it up bitch")
        var post3 = Post(imagePath: "", title: "Post 3", description: "This is posts 3's description.")
        
        posts.append(post)
        posts.append(post2)
        posts.append(post3)
        
        tableView.reloadData()
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = posts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostsCell {
            cell.configureCell(post)
            return cell
        } else {
            let cell = PostsCell()
            cell.configureCell(post)
            return cell 
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 85.0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

}













