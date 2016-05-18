//
//  Player.swift
//  IntelligenceCheck
//
//  Created by Emma C Whitaker on 4/25/16.
//  Copyright © 2016 Daniel H Lee. All rights reserved.
//

import Foundation
import UIKit

//default player class
class Player {
    var name = ""
    var charClass : Class
    var charRace : Race
    var charAlign: Alignment
    var charBack: Background
    
    init() {
        let photo1 = UIImage(named: "Default")!
        self.charClass = Class(name: "No class chosen", photo: photo1)
        self.charRace = Race(name: "No race chosen")
        self.charAlign = Alignment(align: "No alignment chosen")
        self.charBack = Background(name: "No background chosen")
    }
}
