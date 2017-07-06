//
//  AddSlotCell.swift
//  ScreenDemo
//
//  Created by Sierra 4 on 06/07/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit

class AddSlotCell: UITableViewCell {
    
    @IBOutlet weak var lblStartTime: UILabel!
    @IBOutlet weak var lblEndTime: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblWaitingPeople: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
