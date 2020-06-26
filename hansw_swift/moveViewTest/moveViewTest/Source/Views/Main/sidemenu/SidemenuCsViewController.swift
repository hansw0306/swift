//
//  SidemenuCsViewController.swift
//  puts
//
//  Created by SANGWON HAN on 2020/06/26.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
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
