//
//  VariableTableViewCell.swift
//  ExpandingTableViewCell + Programiticially
//
//  Created by Muhammad Abdullah Al Mamun on 13/7/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import UIKit

class VariableTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var cellLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
