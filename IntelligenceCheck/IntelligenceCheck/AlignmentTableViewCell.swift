//
//  AlignmentTableViewCell.swift
//  IntelligenceCheck
//
//  Created by Emma C Whitaker on 5/11/16.
//  Copyright © 2016 Daniel H Lee. All rights reserved.
//

import UIKit

class AlignmentTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var alignName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
