//
//  Slot.swift
//  ScreenDemo
//
//  Created by Sierra 4 on 06/07/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import Foundation
import UIKit

class Slot {
    
    var startTime: String?
    var endTime: String?
    var timeSlot: String?
    var waitingPeople: Int?
    
    init(startTime: String?, endTime: String?, timeSlot: String?, waitingPeople: Int?){
        self.startTime = startTime
        self.endTime = endTime
        self.timeSlot = timeSlot
        self.waitingPeople = waitingPeople
    }
}
