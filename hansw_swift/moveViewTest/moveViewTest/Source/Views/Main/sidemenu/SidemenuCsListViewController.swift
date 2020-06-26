//
//  SidemenuCsListViewController.swift
//  puts
//
//  Created by 최다영 on 2018. 8. 29..
//  Copyright © 2018년 컴퓨터. All rights reserved.
//

import Foundation
import UIKit
class SidemenuCsListViewController: UIView {
     @IBOutlet weak var ContantsView: UIView!
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "SidemenuCsList", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    @IBAction func csDetailButtonClick(_ sender: UIButton) {
        let view = SidemenuCsDetailController.instanceFromNib()
        ContantsView.addSubview(view)
    }
    
    @IBAction func backButtonClick(_ sender: UIButton) {
        removeFromSuperview();
    }
    
    @IBAction func writeQnaButtonClick(_ sender: UIButton) {
        let view = SidemenuCsWriteViewController.instanceFromNib()
    
        ContantsView.addSubview(view)
    }
}
