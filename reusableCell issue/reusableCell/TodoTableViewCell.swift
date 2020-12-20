//
//  TodoTableViewCell.swift
//  reusableCell
//
//  Created by Soulchild on 20/12/2018.
//  Copyright © 2018 fluffy. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var checkLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.checkLabel.isHidden = true
        self.taskLabel.text = ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        // reset (hide) the checkmark label
        self.checkLabel.isHidden = true
        
        // reset the task label text
        self.taskLabel.text = ""
    }
    
}
