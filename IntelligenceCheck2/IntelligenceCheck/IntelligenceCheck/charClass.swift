//
//  charClass.swift
//  IntelligenceCheck
//
//  Created by Daniel H Lee on 3/9/16.
//  Copyright © 2016 Daniel H Lee. All rights reserved.
//

import UIKit

class charClass {
    
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    
    // MARK: Initializer
    init?(name: String, photo: UIImage?){
        
        // Initialize stored properties
        self.name = name
        self.photo = photo
        
        // Initialization should fail if there is no name
        if name.isEmpty {
            return nil
        }
    }
}

