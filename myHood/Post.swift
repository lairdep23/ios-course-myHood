//
//  Post.swift
//  myHood
//
//  Created by Evan Laird on 2/24/16.
//  Copyright © 2016 Evan Laird. All rights reserved.
//

import Foundation

class Post {
    
    private var _imagePath: String
    private var _title: String
    private var _postDescript: String
    
    var imagePath: String {
        return _imagePath
    }
    var title: String {
        return _title
    }
    var postDesc: String {
        return _postDescript
    }
    
    init(imagePath: String, title: String, description: String){
        self._imagePath = imagePath
        self._title = title
        self._postDescript = description
    }
}