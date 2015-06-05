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
        return data.count
    }
    
    func getIconType(icon: String) -> String? {
        switch icon {
        case "Black":
            return "black"
        case "Green":
            return "green"
        case "Puerh":
            return "puerh"
        case "Oolong":
            return "oolong"
        case "White":
            return "white"
        case "Herbal":
            return "herbal"
        default:
            return ""
        }
        
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TeaCell") as! TeaListTableViewCell
        
        let tea = data[indexPath.row]
        let teaName = tea["name"] as? String
        let teaIcon = getIconType(tea["type"] as! String!)
        cell.teaTypeIcon.image = UIImage(named: "icon-" + teaIcon! )
        cell.teaLabel.text = teaName
        //cell.delegate = self
        return cell
    }
    
    // MARK:
    func tableViewCellDidSelect(cell: TeaListTableViewCell, sender: AnyObject) {
        // TODO: Implement a way to navigate to the next screen.
        // performSegueWithIdentifier(teaBriefScreen, sender: self)
    }
    
}
