//
//  SidemenuAlarmViewController.swift
//  puts
//
//  Created by SANGWON HAN on 2020/06/26.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

import UIKit

class SidemenuAlarmViewController: UIView {
    @IBOutlet weak var alarmContentsView: UIView!
    @IBOutlet weak var alarmSettingView: UIView!
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "SidemenuAlarm", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
        @IBAction func alarmSettingButtonClick(_ sender: UIButton) {
           
            alarmContentsView.isHidden = true
            alarmSettingView.isHidden = false
        }
            
        @IBAction func alarmReturnButtonClick(_ sender: UIButton) {
            alarmContentsView.isHidden = false
            alarmSettingView.isHidden = true
        }
        
}
