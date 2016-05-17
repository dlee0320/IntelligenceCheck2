//
//  CharacterClassViewController.swift
//  IntelligenceCheck
//
//  Created by Daniel H Lee on 4/13/16.
//  Copyright © 2016 Daniel H Lee. All rights reserved.
//

import UIKit
import Parse
import Bolts

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
    var spinner = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
    
    //default values
    var level = "0"
    var prof = "2"
    var str = "8"
    var dex = "8"
    var con = "8"
    var wis = "8"
    var int = "8"
    var cha = "8"
    var characterName: String? = "default"
    var strValue = ""
    var dexValue = ""
    var conValue = ""
    var intValue = ""
    var wisValue = ""
    var chaValue = ""
    var player : Player = Player()
    var PFPlayer: PFObject = PFObject(className: "Player")
    
    
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
        
        self.view.addSubview(self.spinner)
        self.spinner.hidden = true
        self.view.addConstraint( NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.spinner, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        self.view.addConstraint( NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.spinner, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.className.text = self.player.charClass.name;
        self.classRace.text = self.player.charRace.name;
        
        //save class
        if let parseClass:String = String(self.player.charClass.name)
        {
            self.PFPlayer.setObject(parseClass, forKey: "class")
            self.saveToParse()
        }
        else
        {
            self.PFPlayer.setObject("", forKey: "class")
            self.saveToParse()
        }
        
        //save race
        if let parseRace:String = String(self.player.charRace.name)
        {
            self.PFPlayer.setObject(parseRace, forKey: "race")
            self.saveToParse()
        }
        else
        {
            self.PFPlayer.setObject("", forKey: "race")
            self.saveToParse()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard
        nameEntry.resignFirstResponder()
        levelEntry.resignFirstResponder()
        profEntry.resignFirstResponder()
        strEntry.resignFirstResponder()
        dexEntry.resignFirstResponder()
        conEntry.resignFirstResponder()
        intEntry.resignFirstResponder()
        wisEntry.resignFirstResponder()
        chaEntry.resignFirstResponder()
        return true
    }
    
    //will check parse for another user by this name and will update view with previous values if name previously entered
    func textFieldDidEndEditing(textField: UITextField) {
        self.spinner.hidden = false
        self.spinner.startAnimating()
        
        if self.PFPlayer.objectForKey("PlayerName") == nil
        {
        let query = PFQuery(className: "Players")
        query.whereKey("PlayerName", equalTo: nameEntry.text!)
        query.findObjectsInBackgroundWithBlock { (results, error) in
            
            self.spinner.stopAnimating()
            self.spinner.hidden = true
            
            if results?.count > 0
            {
                self.PFPlayer = results![0]
                self.readFromParse()
            }
            else
            {
                //declare parse object//
                self.PFPlayer = PFObject(className: "Players")
                
                //save
                self.PFPlayer["PlayerName"] = self.nameEntry.text;
            }
            self.saveToParse()
            }
        }
        else
        {
            self.saveToParse()
        }
    }
    
    //scans parse server for entry and updates text field
    func readFromParse()
    {
        if let strength = self.PFPlayer.objectForKey("strengthPoints") as! Int?
        {
            self.strEntry.text = String(strength)
        }
        if let dexterity = self.PFPlayer.objectForKey("dexterityPoints") as! Int?
        {
            self.dexEntry.text = String(dexterity)
        }
        if let constitution = self.PFPlayer.objectForKey("constitutionPoints") as! Int?
        {
            self.conEntry.text = String(constitution)
        }
        if let intelligence = self.PFPlayer.objectForKey("intelligencePoints") as! Int?
        {
            self.intEntry.text = String(intelligence)
        }
        if let wisdom = self.PFPlayer.objectForKey("wisdomPoints") as! Int?
        {
            self.wisEntry.text = String(wisdom)
        }
        if let charisma = self.PFPlayer.objectForKey("charismaPoints") as! Int?
        {
            self.chaEntry.text = String(charisma)
        }
        if let proficiency = self.PFPlayer.objectForKey("proficiencyBonus") as! Int?
        {
            self.profEntry.text = String(proficiency)
        }
        if let level = self.PFPlayer.objectForKey("level") as! Int?
        {
            self.levelEntry.text = String(level)
        }
        if let Class = self.PFPlayer.objectForKey("class") as! String?
        {
            self.player.charClass.name = String(Class)
        }
        if let race = self.PFPlayer.objectForKey("race") as! String?
        {
            self.player.charRace.name = String(race)
            
        }
    }
    
    func saveToParse()
    {
    
        //enter data//
        nameField.text = nameEntry.text

        //strength
        str = strEntry.text!
        
        //convert to int
        if let parseStr:Int = Int(strEntry.text!)
        {
            self.PFPlayer.setObject(parseStr, forKey: "strengthPoints")
        }
        else
        {
            self.PFPlayer.setObject(0, forKey: "strengthPoints")
        }
        
        //dexterity
        dex = dexEntry.text!
        
        //convert to int
        if let parseDex:Int = Int(dexEntry.text!)
        {
            self.PFPlayer.setObject(parseDex, forKey: "dexterityPoints")
        }
        else
        {
            self.PFPlayer.setObject(0, forKey: "dexterityPoints")
        }
       
        //constitution
        con = conEntry.text!
        
        //save
        if let parseCon:Int = Int(conEntry.text!)
        {
            self.PFPlayer.setObject(parseCon, forKey: "constitutionPoints")
        }
        else
        {
            self.PFPlayer.setObject(0, forKey: "constitutionPoints")
        }
       
        //intelligence
        int = intEntry.text!
        
        //save
        if let parseInt:Int = Int(intEntry.text!)
        {
            self.PFPlayer.setObject(parseInt, forKey: "intelligencePoints")
        }
        else
        {
            self.PFPlayer.setObject(0, forKey: "intelligencePoints")
        }
       
        //wisdom
        wis = wisEntry.text!
        
        //save
        if let parseWis:Int = Int(wisEntry.text!)
        {
            self.PFPlayer.setObject(parseWis, forKey: "wisdomPoints")
        }
        else
        {
            self.PFPlayer.setObject(0, forKey: "wisdomPoints")
        }
       
        //charisma
        cha = chaEntry.text!
        
        //save
        if let parseCha:Int = Int(chaEntry.text!)
        {
            self.PFPlayer.setObject(parseCha, forKey: "charismaPoints")
        }
        else
        {
            self.PFPlayer.setObject(0, forKey: "charismaPoints")
        }
      
        //profficiency
        prof = profEntry.text!
        
        //save
        if let parseProf:Int = Int(profEntry.text!)
        {
            self.PFPlayer.setObject(parseProf, forKey: "proficiencyBonus")
        }
        else
        {
            self.PFPlayer.setObject(0, forKey: "proficiencyBonus")
        }
        
        //level
        if let parseLevel:Int = Int(levelEntry.text!)
        {
            self.PFPlayer.setObject(parseLevel, forKey: "level")
        }
        else
        {
            self.PFPlayer.setObject(0, forKey: "level")
        }
        
        //parse save//
        
        self.PFPlayer.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                //object has been saved
            }
            else {
                //there was a problem...
            }
        }
        
        ////
        
        //vales for math on the side of the text boxes
        if (str == "8"){
            strValue = "-1"
            strMod.text = strValue
        }
        if (str == "9"){
            strValue = "-1"
            strMod.text = strValue
        }
        if (str == "10"){
            strValue = "0"
            strMod.text = strValue
        }
        if (str == "11"){
            strValue = "0"
            strMod.text = strValue
        }
        if (str == "12"){
            strValue = "+1"
            strMod.text = strValue
        }
        if (str == "13"){
            strValue = "+1"
            strMod.text = strValue
        }
        if (str == "14"){
            strValue = "+2"
            strMod.text = strValue
        }
        if (str == "15"){
            strValue = "+2"
            strMod.text = strValue
        }
        if (str == "16"){
            strValue = "+3"
            strMod.text = strValue
        }
        if (str == "17"){
            strValue = "+3"
            strMod.text = strValue
        }
        if (str == "18"){
            strValue = "+4"
            strMod.text = strValue
        }
        if (str == "19"){
            strValue = "+4"
            strMod.text = strValue
        }
        if (str == "20"){
            strValue = "+5"
            strMod.text = strValue
        }
        if (dex == "8"){
            dexValue = "-1"
            dexMod.text = dexValue
        }
        if (dex == "9"){
            dexValue = "-1"
            dexMod.text = dexValue
        }
        if (dex == "10"){
            dexValue = "0"
            dexMod.text = dexValue
        }
        if (dex == "11"){
            dexValue = "0"
            dexMod.text = dexValue
        }
        if (dex == "12"){
            dexValue = "+1"
            dexMod.text = dexValue
        }
        if (dex == "13"){
            dexValue = "+1"
            dexMod.text = dexValue
        }
        if (dex == "14"){
            dexValue = "+2"
            dexMod.text = dexValue
        }
        if (dex == "15"){
            dexValue = "+2"
            dexMod.text = dexValue
        }
        if (dex == "16"){
            dexValue = "+3"
            dexMod.text = dexValue
        }
        if (dex == "17"){
            dexValue = "+3"
            dexMod.text = dexValue
        }
        if (dex == "18"){
            dexValue = "+4"
            dexMod.text = dexValue
        }
        if (dex == "19"){
            dexValue = "+4"
            dexMod.text = dexValue
        }
        if (dex == "20"){
            dexValue = "+5"
            dexMod.text = dexValue
        }
        if (con == "8"){
            conValue = "-1"
            conMod.text = conValue
        }
        if (con == "9"){
            conValue = "-1"
            conMod.text = conValue
        }
        if (con == "10"){
            conValue = "0"
            conMod.text = conValue
        }
        if (con == "11"){
            conValue = "0"
            conMod.text = conValue
        }
        if (con == "12"){
            conValue = "+1"
            conMod.text = conValue
        }
        if (con == "13"){
            conValue = "+1"
            conMod.text = conValue
        }
        if (con == "14"){
            conValue = "+2"
            conMod.text = conValue
        }
        if (con == "15"){
            conValue = "+2"
            conMod.text = conValue
        }
        if (con == "16"){
            conValue = "+3"
            conMod.text = conValue
        }
        if (con == "17"){
            conValue = "+3"
            conMod.text = conValue
        }
        if (con == "18"){
            conValue = "+4"
            conMod.text = conValue
        }
        if (con == "19"){
            conValue = "+4"
            conMod.text = conValue
        }
        if (con == "20"){
            conValue = "+5"
            conMod.text = conValue
        }
        if (int == "8"){
            intValue = "-1"
            intMod.text = intValue
        }
        if (int == "9"){
            intValue = "-1"
            intMod.text = intValue
        }
        if (int == "10"){
            intValue = "0"
            intMod.text = intValue
        }
        if (int == "11"){
            intValue = "0"
            intMod.text = intValue
        }
        if (int == "12"){
            intValue = "+1"
            intMod.text = intValue
        }
        if (int == "13"){
            intValue = "+1"
            intMod.text = intValue
        }
        if (int == "14"){
            intValue = "+2"
            intMod.text = intValue
        }
        if (int == "15"){
            intValue = "+2"
            intMod.text = intValue
        }
        if (int == "16"){
            intValue = "+3"
            intMod.text = intValue
        }
        if (int == "17"){
            intValue = "+3"
            intMod.text = intValue
        }
        if (int == "18"){
            intValue = "+4"
            intMod.text = intValue
        }
        if (int == "19"){
            intValue = "+4"
            intMod.text = intValue
        }
        if (int == "20"){
            intValue = "+5"
            intMod.text = intValue
        }
        if (wis == "8"){
            wisValue = "-1"
            wisMod.text = wisValue
        }
        if (wis == "9"){
            wisValue = "-1"
            wisMod.text = wisValue
        }
        if (wis == "10"){
            wisValue = "0"
            wisMod.text = wisValue
        }
        if (wis == "11"){
            wisValue = "0"
            wisMod.text = wisValue
        }
        if (wis == "12"){
            wisValue = "+1"
            wisMod.text = wisValue
        }
        if (wis == "13"){
            wisValue = "+1"
            wisMod.text = wisValue
        }
        if (wis == "14"){
            wisValue = "+2"
            wisMod.text = wisValue
        }
        if (wis == "15"){
            wisValue = "+2"
            wisMod.text = wisValue
        }
        if (wis == "16"){
            wisValue = "+3"
            wisMod.text = wisValue
        }
        if (wis == "17"){
            wisValue = "+3"
            wisMod.text = wisValue
        }
        if (wis == "18"){
            wisValue = "+4"
            wisMod.text = wisValue
        }
        if (wis == "19"){
            wisValue = "+4"
            wisMod.text = wisValue
        }
        if (wis == "20"){
            wisValue = "+5"
            wisMod.text = wisValue
        }
        if (cha == "8"){
            chaValue = "-1"
            chaMod.text = chaValue
        }
        if (cha == "9"){
            chaValue = "-1"
            chaMod.text = chaValue
        }
        if (cha == "10"){
            chaValue = "0"
            chaMod.text = chaValue
        }
        if (cha == "11"){
            chaValue = "0"
            chaMod.text = chaValue
        }
        if (cha == "12"){
            chaValue = "+1"
            chaMod.text = chaValue
        }
        if (cha == "13"){
            chaValue = "+1"
            chaMod.text = chaValue
        }
        if (cha == "14"){
            chaValue = "+2"
            chaMod.text = chaValue
        }
        if (cha == "15"){
            chaValue = "+2"
            chaMod.text = chaValue
        }
        if (cha == "16"){
            chaValue = "+3"
            chaMod.text = chaValue
        }
        if (cha == "17"){
            chaValue = "+3"
            chaMod.text = chaValue
        }
        if (cha == "18"){
            chaValue = "+4"
            chaMod.text = chaValue
        }
        if (cha == "19"){
            chaValue = "+4"
            chaMod.text = chaValue
        }
        if (cha == "20"){
            chaValue = "+5"
            chaMod.text = chaValue
        }
        
    }

    // MARK: Actions
    @IBOutlet weak var className: UILabel!
    @IBOutlet weak var classRace: UILabel!
    
}