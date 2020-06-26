//
//  SidemenuCsDetailViewController.swift
//  puts
//
//  Created by SANGWON HAN on 2020/06/26.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
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
