//
//  SidemenuCsViewController.swift
//  puts
//
//  Created by 최다영 on 2018. 8. 17..
//  Copyright © 2018년 컴퓨터. All rights reserved.
//

import UIKit

class SidemenuCsViewController: UIView {
    @IBOutlet weak var ContantsView: UIView!
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "SidemenuCs", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    @IBAction func noticeClick(_ sender: UIButton) {
        let view = SidemenuCsListViewController.instanceFromNib()
        ContantsView.addSubview(view)
    }
    
}
