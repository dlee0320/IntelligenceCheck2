//
//  BackgroundTableViewController.swift
//  IntelligenceCheck
//
//  Created by Emma C Whitaker on 5/11/16.
//  Copyright © 2016 Daniel H Lee. All rights reserved.
//

import UIKit

class BackgroundTableViewController: UITableViewController {
    
    // MARK: Properties
    var player : Player?;
    
    var backgrounds = [Background]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // Load the backgrounds
        loadBackgrounds()
    }
    
    func loadBackgrounds(){
        let back1 = Background(name: "Acolyte")
        
        let back2 = Background(name: "Charlatan")
        
        let back3 = Background(name: "Criminal")
        
        let back4 = Background(name: "Entertainer")
        
        let back5 = Background(name: "Folk Hero")
        
        let back6 = Background(name: "Guild Artisan")
        
        let back7 = Background(name: "Hermit")
        
        let back8 = Background(name: "Noble")
        
        let back9 = Background(name: "Outlander")
        
        let back10 = Background(name: "Sage")
        
        let back11 = Background(name: "Sailor")
        
        let back12 = Background(name: "Soldier")
        
        let back13 = Background(name: "Urchin")
        
        backgrounds += [back1, back2, back3, back4, back5, back6, back7, back8, back9, back10, back11, back12, back13]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    @IBAction func onDone4(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return backgrounds.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier
        let cellIdentifier = "BackgroundTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! BackgroundTableViewCell

        // Fetches the appropriate race for the data source layout
        let Background = backgrounds[indexPath.row]
        
        cell.backName.text = Background.name
        
        if (self.player?.charBack.name == Background.name)
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
        self.player?.charBack = self.backgrounds[row]
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
