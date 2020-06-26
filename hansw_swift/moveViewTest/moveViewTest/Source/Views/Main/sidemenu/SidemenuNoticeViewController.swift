//
//  SidemenuNoticeViewController.swift
//  puts
//
//  Created by 최다영 on 2018. 8. 17..
//  Copyright © 2018년 컴퓨터. All rights reserved.
//

import UIKit

class SidemenuNoticeViewController: UIView {
    @IBOutlet weak var noticeImage: UIImageView!
    @IBOutlet weak var noticeTextHeight: NSLayoutConstraint!
    @IBOutlet weak var noticeView: UITextView!
    
    
    var isNoticeOpen = false
    
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "SidemenuNotice", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    @IBAction func noticeClick(_ sender: UIButton) {
        if isNoticeOpen == false {
            noticeTextHeight.constant = noticeView.contentSize.height
            isNoticeOpen = true
            noticeImage.image = UIImage(named: "buy_arrow_top_gray.png")
        }else {
            noticeTextHeight.constant = 0
            isNoticeOpen = false
            noticeImage.image = UIImage(named: "buy_arrow_bottom_gray.png")
        }
    }
    
}
