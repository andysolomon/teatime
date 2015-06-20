//
//  TeaListTableViewCell.swift
//  Teatime
//
//  Created by Andrew Solomon on 6/3/15.
//  Copyright (c) 2015 teateam. All rights reserved.
//

import UIKit

protocol TeaListTableViewCellDelegate: class {
    func teaListTableViewCellDidTouchTeaCell (cell: TeaListTableViewCell, sender:AnyObject)
}

class TeaListTableViewCell: UITableViewCell {

    @IBOutlet var teaTypeIcon: UIImageView!

    @IBOutlet var teaLabel: UILabel!
  
    weak var delegate: TeaListTableViewCellDelegate?
    
    @IBAction func teaCellDidTouch(sender: UIButton) {
        delegate?.teaListTableViewCellDidTouchTeaCell(self, sender: sender)
    }
    func configureWithTea(tea: JSON) {
        let teaName = tea["name"].string!
        let teaIcon = getIconType(tea["type"].string!)
        
        teaTypeIcon.image = UIImage(named: "icon-" + teaIcon! )
        teaLabel.text = teaName
    }
}
