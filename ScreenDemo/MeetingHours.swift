//
//  MeetingHours.swift
//  ScreenDemo
//
//  Created by Sierra 4 on 06/07/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import Foundation
import UIKit

class MeetingHours {
    
    var dayName: String?
    var isSelected: String?
    var slot: [Slot]?
    
    init(dayName: String?, isSelected: String?, slot: [Slot]?) {
        self.dayName = dayName
        self.isSelected = isSelected
        self.slot = slot
    }
}
