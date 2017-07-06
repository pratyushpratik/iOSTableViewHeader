//
//  TableViewDataSource.swift
//  Realm
//
//  Created by Pratyush Pratik on 29/09/15.
//  Copyright (c) 2015 Gagan. All rights reserved.
//

//MARK:- MODULES
import UIKit

//MARK:- TYPEALIAS
typealias  ListCellConfigureBlock = (_ cell : AnyObject? , _ item : AnyObject? , _ indexpath: IndexPath?) -> ()
typealias  DidSelectedRow = (_ indexPath : IndexPath) -> ()
typealias  ScrollViewDidScroll = (_ scrollView : UIScrollView) -> ()
typealias ViewForHeaderInSection = (_ section : Int) -> UIView?
typealias  DidDeselectedRow = (_ indexPath : IndexPath) -> ()
typealias CanEditRowAt = (_ indexPath : IndexPath) -> Bool
typealias  CommitEditingStyle = (_ commiteditingStyle: UITableViewCellEditingStyle, _ indexPath : IndexPath) -> ()
typealias HeightForRowAt = (_ indexPath : IndexPath) -> CGFloat

//MARK:- CLASS
class TableViewDataSource: NSObject  {
    
    //MARK:- PROPERTIES
    var _section: [String]?
    var sectionCount: Array<AnyObject>?
    var rowCount : Array<AnyObject>?
    var cellIdentifier : String?
    var tableView  : UITableView?
    
    var configureCellBlock : ListCellConfigureBlock?
    var aRowSelectedListener : DidSelectedRow?
    var ScrollViewListener : ScrollViewDidScroll?
    var viewforHeaderInSection : ViewForHeaderInSection?
    var headerHeight : CGFloat?
    var aRowDeselectedListener : DidDeselectedRow?
    var aRowEditListener : CanEditRowAt?
    var aRowCommitListener : CommitEditingStyle?
    var aRowHeightListener : HeightForRowAt?
    
    init (tableView : UITableView?, cellIdentifier : String?,  sectionCount: Array<AnyObject>?, rowCount : Array<AnyObject>? , height : HeightForRowAt? ,  configureCellBlock : ListCellConfigureBlock? , aRowSelectedListener : @escaping DidSelectedRow,aRowDeselectedListener: @escaping DidDeselectedRow ,aRowCommitListener: @escaping CommitEditingStyle, DidScrollListener : ScrollViewDidScroll?, _headerHeight: CGFloat?, section: [String]? , viewforHeaderInSection : ViewForHeaderInSection? = nil) {
        
        self.tableView = tableView
        self.sectionCount = sectionCount
        self.rowCount = rowCount
        self.cellIdentifier = cellIdentifier
        self.aRowHeightListener = height
        self.configureCellBlock = configureCellBlock
        self.aRowSelectedListener = aRowSelectedListener
        self.aRowDeselectedListener = aRowDeselectedListener
        self.aRowCommitListener = aRowCommitListener
        self.ScrollViewListener = DidScrollListener
        self.headerHeight = _headerHeight
        self._section = section
        
    }
    
    override init() {
        super.init()
    }
}

//MARK:- DELEGATE, DATASOURCE
extension TableViewDataSource : UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let identifier = cellIdentifier else { fatalError("Cell identifier not provided") }
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier , for: indexPath) as UITableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        if let block = self.configureCellBlock , let item: AnyObject = self.rowCount?[(indexPath as NSIndexPath).row]{
            block(cell , item , indexPath as IndexPath?)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let block = self.aRowSelectedListener{
            block(indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rowCount?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionCount?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let block = self.aRowHeightListener else { return 0.0 }
        return block(indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let block = viewforHeaderInSection else { return nil }
        return block(section)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self._section?[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight ?? 0.0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let block = self.ScrollViewListener{
            block(scrollView)
        }
    }
        
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let block = self.aRowDeselectedListener {
            block(indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        guard let block = self.aRowEditListener else { return false }
        return block(indexPath)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if let block = self.aRowCommitListener{
            block(editingStyle, indexPath)
        }
    }
}
