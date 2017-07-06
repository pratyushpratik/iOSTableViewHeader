//
//  ViewController.swift
//  ScreenDemo
//
//  Created by Sierra 4 on 06/07/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit
import IBAnimatable

class ViewController: UIViewController {
    
    //Mark: -Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //Mark: - Properties
    var dataSource : TableViewDataSource?
    var items = ["a" ]
    var arrSection = ["My Meetings"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    @IBAction func btnActionCreateMeeting(_ sender: UIButton) {
        
    }
    
    func configureTableView(){
        
        dataSource = TableViewDataSource(tableView: tableView, cellIdentifier: "MeetingsCell", sectionCount: arrSection as Array<AnyObject>, rowCount: items as Array<AnyObject>, height: { (indexPath) -> CGFloat in
            return 120
        }, configureCellBlock: { (cell, item, indexPath) in
            print("")
            
        }, aRowSelectedListener: {_ in}, aRowDeselectedListener: {_ in}, aRowCommitListener: {_ in}, DidScrollListener: {_ in}, _headerHeight: 20, section: arrSection)
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.reloadData()
        
    }
    
}

