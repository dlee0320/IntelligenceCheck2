
//  CharacterSheetViewController.swift
//  IntelligenceCheck
//
//  Created by Daniel H Lee on 3/9/16.
//  Copyright © 2016 Daniel H Lee. All rights reserved.
//

import UIKit

class CharacterSheetViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field's user input through delegate callbacks
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }

    
}

