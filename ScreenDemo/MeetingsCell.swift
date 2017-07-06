//
//  MeetingsCell.swift
//  ScreenDemo
//
//  Created by Sierra 4 on 06/07/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit

class MeetingsCell: UITableViewCell {

    //Mark: - Outlets
    
    @IBOutlet weak var lblAttendingNumber: UILabel!
    @IBOutlet weak var lblWaitingNumbers: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
