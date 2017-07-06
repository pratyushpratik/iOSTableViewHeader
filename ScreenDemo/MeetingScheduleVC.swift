//
//  MeetingScheduleVC.swift
//  ScreenDemo
//
//  Created by Sierra 4 on 06/07/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit

class MeetingScheduleVC: UIViewController {
    
    //Mark: -Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //Mark: - Variables
    var  dataSource : TableViewDataSource?
    var items = ["a"]
    var arrSection = ["a"]
    var days = ["Monday" , "Tuesday" ,"Wed" ,"Thurs" , "Fri" , "Sat"]
    var neelamHeight: CGFloat? = 150.0
    
    var meetingHours: [MeetingHours] = [MeetingHours(dayName: "Monday", isSelected: "1", slot: [Slot(startTime: "12:00", endTime: "12:00", timeSlot: "15 minute", waitingPeople: 10)]),MeetingHours(dayName: "Tuesday", isSelected: "1", slot:[Slot(startTime: "12:00", endTime: "12:00", timeSlot: "15 minute",waitingPeople: 10)]),MeetingHours(dayName: "Wednesday", isSelected: "1", slot: [Slot(startTime: "12:00", endTime: "12:00", timeSlot: "15 minute",waitingPeople: 10)]),MeetingHours(dayName: "Thursday", isSelected: "1", slot: [Slot(startTime: "12:00", endTime: "12:00", timeSlot: "15 minute",waitingPeople: 10)]),MeetingHours(dayName: "Friday", isSelected: "1", slot: [Slot(startTime: "12:00", endTime: "12:00", timeSlot: "15 minute",waitingPeople: 10)]),MeetingHours(dayName: "Saturday", isSelected: "1", slot: [Slot(startTime: "12:00", endTime: "12:00", timeSlot: "15 minute",waitingPeople: 10)]) , MeetingHours(dayName: "Sunday", isSelected: "1", slot: [Slot(startTime: "12:00", endTime: "12:00", timeSlot: "15 minute",waitingPeople: 10)])]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // configureTableView()
        tableView.estimatedRowHeight = neelamHeight ?? 0.0
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib.init(nibName: "MeetingSectionHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "MeetingSectionHeader")
        
    }
    
    //        func configureTableView(){
    //            dataSource = TableViewDataSource(tableView: tableView, cellIdentifier: "AddSlotCell", sectionCount: arrSection as Array<AnyObject>, rowCount: items as Array<AnyObject>, height: { (indexPath) -> CGFloat in
    //                return 40
    //            }, configureCellBlock: { (cell, item, indexPath) in
    //                print("")
    //            }, aRowSelectedListener: {_ in}, aRowDeselectedListener: {_ in}, aRowCommitListener: {_ in}, DidScrollListener: {_ in}, _headerHeight: 0, section: nil , ViewForHeaderInSection : { (section) in
    //
    //                let headerView = MeetingSectionHeader(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.width, height: 56.0))
    //                return headerView
    //
    //            })
    //            tableView.dataSource = dataSource
    //            tableView.delegate = dataSource
    //            tableView.reloadData()
    //        }
}

extension MeetingScheduleVC : UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return meetingHours.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let sectionHeaderView = tableView.headerView(forSection: indexPath.section) as? MeetingSectionHeader
        //        sectionHeaderView?.sw
        //
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddSlotCell", for: indexPath) as? AddSlotCell else {return UITableViewCell()}
        cell.lblStartTime.text = meetingHours[indexPath.section].slot?[indexPath.row].startTime
        cell.lblEndTime.text = meetingHours[indexPath.section].slot?[indexPath.row].endTime
        cell.lblTime.text = meetingHours[indexPath.section].slot?[indexPath.row].timeSlot
        cell.lblWaitingPeople.text = "\(String(describing: meetingHours[indexPath.section].slot?[indexPath.row].waitingPeople ?? 0))"
        return cell
        //        }
        //        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = MeetingSectionHeader(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.width, height: 56.0))
        headerView.lblDay.text = meetingHours[section].dayName
        headerView.switchAction.isOn = meetingHours[section].isSelected?.toBool ?? Bool()
        headerView.delegate = self
        headerView.section = section
        //        if headerView.switchAction.isOn == true {
        //            neelamHeight = 150.0
        ////            let indexNeelam = IndexPath.init(row: <#T##Int#>, section: <#T##Int#>)
        ////            tableView.reloadRows(at: <#T##[IndexPath]#>, with: <#T##UITableViewRowAnimation#>)
        //            let indexSetNeelam = IndexSet.init(integer: headerView.switchAction.tag)
        //            tableView.reloadSections(indexSetNeelam, with: .fade)
        //        }
        //        else {
        //            neelamHeight = 0
        //            let indexSetNeelam = IndexSet.init(integer: headerView.switchAction.tag)
        //            tableView.reloadSections(indexSetNeelam, with: .fade)
        //        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 56.0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return neelamHeight ?? 0
    }
}

extension MeetingScheduleVC: RowHgtDelegate {
    
    func rowHgt(_section: Int, _hgt: CGFloat, _value: String) {
        neelamHeight = _hgt
        let model = meetingHours[_section]
        model.isSelected = _value == "true" ? "1" : "0"
        meetingHours[_section] = model
        let indexPath = IndexPath(row: 0, section: _section)
        if let visibleIndexPaths = tableView.indexPathsForVisibleRows?.index(of: indexPath as IndexPath) {
            if visibleIndexPaths != NSNotFound {
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        //        let indexPath = IndexPath(row: 0, section: _section)
        //        tableView.reloadRows(at: [indexPath], with: .fade)
        ////        let indexSet = IndexSet(integer: _section)
        ////        tableView.reloadSections(indexSet, with: .fade)
        //        tableView.reloadSections(IndexSet(integer: _section), with: .fade)
        
    }
}


extension String {
    
    var toBool : Bool? {
        return self.lowercased() == "true" || self.lowercased() == "1"
    }
}
