//
//  Class.swift
//  IntelligenceCheck
//
//  Created by Daniel H Lee on 4/13/16.
//  Copyright © 2016 Daniel H Lee. All rights reserved.
//

import UIKit

//form for class in pop up menu
class Class {
    
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    
    // MARK: Initialization
    
    init(name: String, photo: UIImage?){
        // Initialize stored properties
        self.name = name
        self.photo = photo
    }

    
}
