//
//  CharacterClassTableViewController.swift
//  IntelligenceCheck
//
//  Created by Daniel H Lee on 4/13/16.
//  Copyright © 2016 Daniel H Lee. All rights reserved.
//

import UIKit

class CharacterClassTableViewController: UITableViewController {

    // MARK: Properties
    var player : Player?;
    
    var classes = [Class]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // Load the classes
        loadClasses()
    }

    func loadClasses(){
        let photo1 = UIImage(named: "Barbarian")!
        let class1 = Class(name: "Barbarian", photo: photo1)
        
        let photo2 = UIImage(named: "Bard")!
        let class2 = Class(name: "Bard", photo: photo2)
        
        let photo3 = UIImage(named: "Cleric")!
        let class3 = Class(name: "Cleric", photo: photo3)
        
        let photo4 = UIImage(named: "Druid")!
        let class4 = Class(name: "Druid", photo: photo4)
        
        let photo5 = UIImage(named: "Fighter")!
        let class5 = Class(name: "Fighter", photo: photo5)
        
        let photo6 = UIImage(named: "Monk")!
        let class6 = Class(name: "Monk", photo: photo6)
        
        let photo7 = UIImage(named: "Paladin")!
        let class7 = Class(name: "Paladin", photo: photo7)
        
        let photo8 = UIImage(named: "Ranger")!
        let class8 = Class(name: "Ranger", photo: photo8)
        
        let photo9 = UIImage(named: "Rogue")!
        let class9 = Class(name: "Rogue", photo: photo9)
        
        let photo10 = UIImage(named: "Sorceror")!
        let class10 = Class(name: "Sorceror", photo: photo10)
        
        let photo11 = UIImage(named: "Warlock")!
        let class11 = Class(name: "Warlock", photo: photo11)
        
        let photo12 = UIImage(named: "Wizard")!
        let class12 = Class(name: "Wizard", photo: photo12)
        
        classes += [class1, class2, class3, class4, class5, class6, class7, class8, class9, class10, class11, class12]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    @IBAction func onDone(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return classes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier
        let cellIdentifier = "CharacterClassTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CharacterClassTableViewCell
        
        // Fetches the appropriate meal for the data source layout
        let Class = classes[indexPath.row]
        
        cell.classLabel.text = Class.name
        cell.classImageView.image = Class.photo
        
        if (self.player?.charClass.name == Class.name)
        {
            cell.accessoryType = .Checkmark
        }
        else
        {
            cell.accessoryType = .None
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row
        self.player?.charClass = self.classes[row]
        self.tableView.reloadData()
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        //self.dismissViewControllerAnimated(true, completion: nil)
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

    
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
    

}
