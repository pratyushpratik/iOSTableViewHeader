//
//  MeetingSectionHeader.swift
//  ScreenDemo
//
//  Created by Sierra 4 on 06/07/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit

protocol RowHgtDelegate{
    func rowHgt(_section: Int, _hgt: CGFloat, _value: String)
}

class MeetingSectionHeader: UIView {

    @IBOutlet weak var switchAction: UISwitch!
    @IBOutlet weak var lblDay: UILabel!
    
    var delegate: RowHgtDelegate?
    var section: Int?

    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "MeetingSectionHeader", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView else {return UIView()}
        return view
    }
    
    
    func xibSetup() {
        let view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(view)
        // setUI()
    }
    
    //MARK::- Ovveride Functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        xibSetup()
    }
    
    @IBAction func switchActionUpdate(_ sender: UISwitch) {
        
        if switchAction.isOn == true {
            print("neelam")
            delegate?.rowHgt(_section: section ?? 0 , _hgt: 150, _value: "true")
        }
        else {
            print ("hey there")
            delegate?.rowHgt(_section: section ?? 0 , _hgt: 0, _value: "false")
        }
    }
    
//    @IBAction func switchActionUpdate(_ sender: UIButton) {
//        
//        if switchAction.isOn == true {
//            print("neelam")
//            delegate?.rowHgt(_section: sender.tag , _hgt: 150)
//        }
//        else {
//            print ("hey there")
//             delegate?.rowHgt(_section: sender.tag , _hgt: 0)
//        }
//    }
}
