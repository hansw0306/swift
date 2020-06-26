//
//  SidemenuAlarmSettingViewController.swift
//  puts
//
//  Created by SANGWON HAN on 2020/06/26.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

import UIKit

class SidemenuAlarmSettingViewController: UIView {

    class func instanceFromNib() -> UIView {
        return UINib(nibName: "SidemenuAlarmSetting", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

    @IBAction func alarmReturnButtonClick(_ sender: UIButton) {
       removeFromSuperview();
    }
}
