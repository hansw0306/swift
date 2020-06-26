//
//  SidemenuCsDetailViewController.swift
//  puts
//
//  Created by 최다영 on 2018. 8. 29..
//  Copyright © 2018년 컴퓨터. All rights reserved.
//

import Foundation
import UIKit
class SidemenuCsDetailController: UIView {
    @IBOutlet weak var ContantsView: UIView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewHeight: NSLayoutConstraint!
    
    
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "SidemenuCsDetail", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    @IBAction func backButtonClick(_ sender: UIButton) {
        removeFromSuperview();
    }
    
}
