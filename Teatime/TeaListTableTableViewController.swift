//
//  TeaListTableTableViewController.swift
//  Teatime
//
//  Created by Andrew Solomon on 6/3/15.
//  Copyright (c) 2015 teateam. All rights reserved.
//

import UIKit

class TeaListTableTableViewController: UITableViewController {

    @IBOutlet var addButtonDidPress: UIBarButtonItem!
    
    @IBOutlet var bankButtonDidPress: UIBarButtonItem!
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TeaCell") as! UITableViewCell
        
        return cell
    }
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        return 1
//    }
}
