//
//  SidemenuCouponViewController.swift
//  puts
//
//  Created by SANGWON HAN on 2020/06/26.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

import UIKit

class SidemenuCouponViewController: UIView {

    class func instanceFromNib() -> UIView {
        return UINib(nibName: "SidemenuCoupon", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
