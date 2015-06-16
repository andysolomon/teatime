//
//  TeaListTableTableViewController.swift
//  Teatime
//
//  Created by Andrew Solomon on 6/3/15.
//  Copyright (c) 2015 teateam. All rights reserved.
//

import UIKit

class TeaListTableTableViewController: UITableViewController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecipeData.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let data = RecipeData[indexPath.row]
        let dequeued: AnyObject = tableView.dequeueReusableCellWithIdentifier("TeaCell", forIndexPath: indexPath)
        
        let cell = dequeued as? TeaListTableViewCell
        
        let teaName = data["name"] as? String
        let teaIcon = getIconType(data["type"] as! String)
        
        cell?.teaTypeIcon.image = UIImage(named: "icon-" + teaIcon! )
        cell?.teaLabel.text = teaName
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //performSegueWithIdentifier("stepStoneSegue", sender: self)
    }
    
    // MARK:
    func tableViewCellDidSelect(cell: TeaListTableViewCell, sender: AnyObject) {
        // TODO: Implement a way to navigate to the next screen.
        // performSegueWithIdentifier(teaBriefScreen, sender: self)
    }
    
}
