//
//  ClassTableViewController.swift
//  IntelligenceCheck
//
//  Created by Daniel H Lee on 3/9/16.
//  Copyright © 2016 Daniel H Lee. All rights reserved.
//

import UIKit

class ClassTableViewController: UITableViewController {

    // MARK: Properties
    
    var characterClasses = [charClass]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the class data
        loadClasses()
        
    }

    func loadClasses() {
        let photo1 = UIImage(named: "Barbarian")!
        let characterClass1 = charClass(name: "Barbarian", photo: photo1)!
        
        let photo2 = UIImage(named: "Bard")!
        let characterClass2 = charClass(name: "Bard", photo: photo2)!
        
        let photo3 = UIImage(named: "Cleric")!
        let characterClass3 = charClass(name: "Cleric", photo: photo3)!
        
        let photo4 = UIImage(named: "Druid")!
        let characterClass4 = charClass(name: "Druid", photo: photo4)!
        
        let photo5 = UIImage(named: "Fighter")!
        let characterClass5 = charClass(name: "Fighter", photo: photo5)!
        
        let photo6 = UIImage(named: "Monk")!
        let characterClass6 = charClass(name: "Monk", photo: photo6)!
        
        let photo7 = UIImage(named: "Paladin")!
        let characterClass7 = charClass(name: "Paladin", photo: photo7)!
        
        let photo8 = UIImage(named: "Ranger")!
        let characterClass8 = charClass(name: "Ranger", photo: photo8)!
        
        let photo9 = UIImage(named: "Rogue")!
        let characterClass9 = charClass(name: "Rogue", photo: photo9)!
        
        let photo10 = UIImage(named: "Sorcerer")!
        let characterClass10 = charClass(name: "Sorcerer", photo: photo10)!
                
        let photo11 = UIImage(named: "Warlock")!
        let characterClass11 = charClass(name: "Warlock", photo: photo11)!
        
        let photo12 = UIImage(named: "Wizard")!
        let characterClass12 = charClass(name: "Wizard", photo: photo12)!
        
        characterClasses += [characterClass1, characterClass2, characterClass3, characterClass4, characterClass5, characterClass6, characterClass7, characterClass8, characterClass9, characterClass10, characterClass11, characterClass12]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return characterClasses.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier
        let cellIdentifier = "ClassTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ClassTableViewCell
        
        // Fetches the appropriate class for the data source layout
        let characterClass = characterClasses[indexPath.row]
        
        cell.nameLabel.text = characterClass.name
        cell.iconImageView.image = characterClass.photo

        

        return cell
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }
    */

}
