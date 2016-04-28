//
//  CharacterClassViewController.swift
//  IntelligenceCheck
//
//  Created by Daniel H Lee on 4/13/16.
//  Copyright © 2016 Daniel H Lee. All rights reserved.
//

import UIKit

class CharacterSheetViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    @IBOutlet weak var nameEntry: UITextField!

    @IBOutlet weak var nameField: UILabel!
        
    var characterName: String? = "default"
    var player : Player = Player()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field's user input through delegate callbacks
        nameEntry.delegate = self
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //let vc = sender as! CharacterSheetViewController;
        //self.player = vc.player;
       if (segue.identifier == "ClassSegue")
       {
            let nav = segue.destinationViewController as! UINavigationController
            let charClassVc = nav.viewControllers.first as! CharacterClassTableViewController
            charClassVc.player = self.player
       }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.className.text = self.player.charClass.name;
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
    
    func textFieldDidEndEditing(textField: UITextField) {
        nameEntry.text = textField.text
        characterName = nameEntry.text
        nameField.text = nameEntry.text
    }

    // MARK: Actions
    @IBOutlet weak var className: UILabel!
    
}

