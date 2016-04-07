//
//  ClassTableViewCell.swift
//  IntelligenceCheck
//
//  Created by Daniel H Lee on 3/9/16.
//  Copyright © 2016 Daniel H Lee. All rights reserved.
//

import UIKit

class ClassTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
