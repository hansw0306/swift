//
//  SidemenuAlarmViewController.swift
//  puts
//
//  Created by 최다영 on 2018. 8. 17..
//  Copyright © 2018년 컴퓨터. All rights reserved.
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
