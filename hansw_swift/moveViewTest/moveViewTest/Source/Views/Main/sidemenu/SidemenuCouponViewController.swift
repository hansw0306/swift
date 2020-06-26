//
//  SidemenuCouponViewController.swift
//  puts
//
//  Created by 최다영 on 2018. 8. 17..
//  Copyright © 2018년 컴퓨터. All rights reserved.
//

import UIKit

class SidemenuCouponViewController: UIView {

    class func instanceFromNib() -> UIView {
        return UINib(nibName: "SidemenuCoupon", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
