//
//  TeaListTableTableViewController.swift
//  Teatime
//
//  Created by Andrew Solomon on 6/3/15.
//  Copyright (c) 2015 teateam. All rights reserved.
//

import UIKit

class TeaListTableTableViewController: UITableViewController, TeaListTableViewCellDelegate {

    @IBOutlet var addButtonDidPress: UIBarButtonItem!
    
    @IBOutlet var bankButtonDidPress: UIBarButtonItem!
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TeaCell") as! TeaListTableViewCell
        
        cell.teaTypeIcon.image = UIImage(named: "icon-black")
        cell.teaLabel.text = "Boba Guys Blend No. 1"
        cell.delegate = self
        return cell
    }
    
    // MARK:
    func tableViewCellDidSelect(cell: TeaListTableViewCell, sender: AnyObject) {
        // TODO: Implement a way to navigate to the next screen.
        // performSegueWithIdentifier(teaBriefScreen, sender: self)
    }
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        return 1
//    }
}
