//
//  Player.swift
//  IntelligenceCheck
//
//  Created by Emma C Whitaker on 4/25/16.
//  Copyright © 2016 Daniel H Lee. All rights reserved.
//

import Foundation
import UIKit

class Player {
    var name = ""
    var charClass : Class
    
    init() {
        let photo1 = UIImage(named: "Default")!
        self.charClass = Class(name: "No class chosen", photo: photo1)

    }
}
