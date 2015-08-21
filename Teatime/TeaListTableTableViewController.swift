//
//  TeaListTableTableViewController.swift
//  Teatime
//
//  Created by Andrew Solomon on 6/3/15.
//  Copyright (c) 2015 teateam. All rights reserved.
//

import UIKit

class TeaListTableTableViewController: UITableViewController{
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecipeData.count
    }

    private struct Storyboard {
        static let CellReuseIdentifier = "TeaCell"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let dequeued: AnyObject = tableView.dequeueReusableCellWithIdentifier(Storyboard.CellReuseIdentifier, forIndexPath: indexPath)
        let cell = dequeued as! TeaListTableViewCell
        let tea = RecipeData[indexPath.row]
        
        cell.configureWithTea(tea)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //performSegueWithIdentifier("stepStoneSegue", sender: self)
    }
    
    // MARK:
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "stepStoneSegue" {
            let toView = segue.destinationViewController as? StepStoneViewController
            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
            let tea = RecipeData[indexPath.row]
            toView!.tea = tea
        }
    }
    
}
