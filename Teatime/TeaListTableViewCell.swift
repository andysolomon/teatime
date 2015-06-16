//
//  TeaListTableViewCell.swift
//  Teatime
//
//  Created by Andrew Solomon on 6/3/15.
//  Copyright (c) 2015 teateam. All rights reserved.
//

import UIKit

protocol TeaListTableViewCellDelegate: class {
    func tableViewCellDidSelect (cell: TeaListTableViewCell, sender:AnyObject)
}

class TeaListTableViewCell: UITableViewCell {

    @IBOutlet var teaTypeIcon: UIImageView!

    @IBOutlet var teaLabel: UILabel!
    
    //weak var delegate: TeaListTableViewCellDelegate?
    
    //delegate?.tableViewCellDidSelect(self, sender: sender)
    //delegate?.storyTableViewCellDidTouchComment(self, sender: sender)
}
