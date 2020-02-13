//
//  File.swift
//  Cookit
//
//  Created by Neil Quizon on 2020-02-13.
//  Copyright © 2020 Neil Quizon. All rights reserved.
//

import Foundation

class Recipe
{
    var title: String
    
    var steps: [String]
    var imageURL: String
    
    
    
    init(title: String, steps: [String], imageURL: String)
    {
        self.title = title
        self.steps = steps
        self.imageURL = imageURL
    }
}
