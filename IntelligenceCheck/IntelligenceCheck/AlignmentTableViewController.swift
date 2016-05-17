//
//  AlignmentTableViewController.swift
//  IntelligenceCheck
//
//  Created by Emma C Whitaker on 5/11/16.
//  Copyright © 2016 Daniel H Lee. All rights reserved.
//

import UIKit

class AlignmentTableViewController: UITableViewController {

    // MARK: Properties
    var player : Player?;
    
    var alignments = [Alignment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // Load the alignments
        loadAlignments()
    }
    
    func loadAlignments(){
        let alignment1 = Alignment(align: "Lawful Good")
        
        let alignment2 = Alignment(align: "Neutral Good")
        
        let alignment3 = Alignment(align: "Chaotic Good")
        
        let alignment4 = Alignment(align: "Lawful Neutral")
        
        let alignment5 = Alignment(align: "True Neutral")
        
        let alignment6 = Alignment(align: "Chaotic Neutral")
        
        let alignment7 = Alignment(align: "Lawful Evil")
        
        let alignment8 = Alignment(align: "Neutral Evil")
        
        let alignment9 = Alignment(align: "Chaotic Evil")
        
        alignments += [alignment1, alignment2, alignment3, alignment4, alignment5, alignment6, alignment7, alignment8, alignment9]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    @IBAction func onDone3(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return alignments.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier
        let cellIdentifier = "AlignmentTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! AlignmentTableViewCell
        
        // Fetches the appropriate alignment for the data source layout
        let Alignment = alignments[indexPath.row]
        
        cell.alignName.text = Alignment.align

        
        if (self.player?.charAlign.align == Alignment.align)
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
        self.player?.charAlign = self.alignments[row]
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
