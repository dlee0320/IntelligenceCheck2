//
//  RaceTableViewCell.swift
//  IntelligenceCheck
//
//  Created by Emma C Whitaker on 4/20/16.
//  Copyright © 2016 Daniel H Lee. All rights reserved.
//

import UIKit

class RaceTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var raceName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
