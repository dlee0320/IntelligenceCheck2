//
//  CharacterClassViewController.swift
//  IntelligenceCheck
//
//  Created by Daniel H Lee on 4/13/16.
//  Copyright © 2016 Daniel H Lee. All rights reserved.
//

import UIKit
import Parse

class CharacterSheetViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    @IBOutlet weak var nameEntry: UITextField!
    @IBOutlet weak var levelEntry: UITextField!
    @IBOutlet weak var profEntry: UITextField!
    @IBOutlet weak var strEntry: UITextField!
    @IBOutlet weak var dexEntry: UITextField!
    @IBOutlet weak var conEntry: UITextField!
    @IBOutlet weak var intEntry: UITextField!
    @IBOutlet weak var wisEntry: UITextField!
    @IBOutlet weak var chaEntry: UITextField!
    @IBOutlet weak var strMod: UILabel!
    @IBOutlet weak var dexMod: UILabel!
    @IBOutlet weak var conMod: UILabel!
    @IBOutlet weak var intMod: UILabel!
    @IBOutlet weak var wisMod: UILabel!
    @IBOutlet weak var chaMod: UILabel!

    @IBOutlet weak var nameField: UILabel!
    
    var level = 0
    var prof = 2
    var str = 8
    var dex = 8
    var con = 8
    var wis = 8
    var int = 8
    var cha = 8
    var characterName: String? = "default"
    var strValue = ""
    var dexValue = ""
    var conValue = ""
    var intValue = ""
    var wisValue = ""
    var chaValue = ""
    var player : Player = Player()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field's user input through delegate callbacks
        nameEntry.delegate = self
        levelEntry.delegate = self
        profEntry.delegate = self
        strEntry.delegate = self
        dexEntry.delegate = self
        conEntry.delegate = self
        intEntry.delegate = self
        wisEntry.delegate = self
        chaEntry.delegate = self
        
        //test parse!!!
        
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
            
        ////
    }
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //let vc = sender as! CharacterSheetViewController;
        //self.player = vc.player;
       if (segue.identifier == "sheetToClasses")
       {
            let nav = segue.destinationViewController as! UINavigationController
            let charClassVc = nav.viewControllers.first as! CharacterClassTableViewController
            charClassVc.player = self.player
       }
        if (segue.identifier == "sheetToRaces")
        {
            let nav = segue.destinationViewController as! UINavigationController
            let charRaceVc = nav.viewControllers.first as! RaceTableViewController
            charRaceVc.player = self.player
        }
        
    }
    
    func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//        self.className.text = self.player.charClass.name;
//        self.classRace.text = self.player.charRace.name;
    }

    func didReceiveMemoryWarning() {
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
        if (str == 8){
            strValue = "-1"
            strMod.text = strValue
        }
        if (str == 9){
            strValue = "-1"
            strMod.text = strValue
        }
        if (str == 10){
            strValue = "0"
            strMod.text = strValue
        }
        if (str == 11){
            strValue = "0"
            strMod.text = strValue
        }
        if (str == 12){
            strValue = "+1"
            strMod.text = strValue
        }
        if (str == 13){
            strValue = "+1"
            strMod.text = strValue
        }
        if (str == 14){
            strValue = "+2"
            strMod.text = strValue
        }
        if (str == 15){
            strValue = "+2"
            strMod.text = strValue
        }
        if (str == 16){
            strValue = "+3"
            strMod.text = strValue
        }
        if (str == 17){
            strValue = "+3"
            strMod.text = strValue
        }
        if (str == 18){
            strValue = "+4"
            strMod.text = strValue
        }
        if (str == 19){
            strValue = "+4"
            strMod.text = strValue
        }
        if (str == 20){
            strValue = "+5"
            strMod.text = strValue
        }
        
        
    }

//    // MARK: Actions
    weak var className: UILabel!
    weak var classRace: UILabel!
    
}

}