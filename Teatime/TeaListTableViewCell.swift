//
//  TeaListTableViewCell.swift
//  Teatime
//
//  Created by Andrew Solomon on 6/3/15.
//  Copyright (c) 2015 teateam. All rights reserved.
//

import UIKit

class TeaListTableViewCell: UITableViewCell {

    @IBOutlet var teaTypeIcon: UIImageView!

    @IBOutlet var teaLabel: UILabel!
  
    
    func configureWithTea(tea: JSON) {
        let teaName = tea["name"].string!
        let teaIcon = getIconType(tea["type"].string!)
        
        teaTypeIcon.image = UIImage(named: "icon-" + teaIcon! )
        teaLabel.text = teaName
    }
}
