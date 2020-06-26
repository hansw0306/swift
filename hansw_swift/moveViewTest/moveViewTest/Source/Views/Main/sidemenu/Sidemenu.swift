//
//  Sidemenu.swift
//  puts
//
//  Created by SANGWON HAN on 2020/06/26.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

import UIKit

class Sidemenu: UIView {
    @IBOutlet weak var alarmView: UIView!
    @IBOutlet weak var alarmImage: UIImageView!
    @IBOutlet weak var alarmText: UILabel!
    @IBOutlet weak var noticeView: UIView!
    @IBOutlet weak var noticeImage: UIImageView!
    @IBOutlet weak var noticeText: UILabel!
    @IBOutlet weak var noticeText1: UILabel!
    @IBOutlet weak var couponView: UIView!
    @IBOutlet weak var couponImage: UIImageView!
    @IBOutlet weak var couponText: UILabel!
    @IBOutlet weak var cancelView: UIView!
    @IBOutlet weak var cancelImage: UIImageView!
    @IBOutlet weak var cancelText: UILabel!
    @IBOutlet weak var csView: UIView!
    @IBOutlet weak var csImage: UIImageView!
    @IBOutlet weak var csText: UILabel!
    @IBOutlet weak var coopbrandView: UIView!
    @IBOutlet weak var coopbrandImage: UIImageView!
    @IBOutlet weak var coopbrandText: UILabel!

    @IBOutlet weak var alarmContentsView: UIView!
    @IBOutlet weak var alarmSettingView: UIView!
    @IBOutlet weak var noticeContentsView: UIView!
    @IBOutlet weak var couponContentsView: UIView!
    @IBOutlet weak var cancelContentsView: UIView!
    @IBOutlet weak var csContentsView: UIView!
    @IBOutlet weak var coopbrandContentsView: UIView!
    let whiteColor = UIColor.white
    let grayColor = UIColor.darkGray
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "Sidemenu", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    

    @IBAction func alarmSettingButtonClick(_ sender: UIButton) {
        alarmContentsView.isHidden = true
        alarmSettingView.isHidden = false
    }
    
    @IBAction func alarmReturnButtonClick(_ sender: UIButton) {
        alarmContentsView.isHidden = false
        alarmSettingView.isHidden = true
    }
    
    @IBAction func alarmButtonClick(_ sender: UIButton) {
        alarmContentsView.isHidden = false
        noticeContentsView.isHidden = true
        couponContentsView.isHidden = true
        cancelContentsView.isHidden = true
        csContentsView.isHidden = true
        coopbrandContentsView.isHidden = true
        
        alarmView.backgroundColor = whiteColor
        alarmText.textColor = grayColor
        alarmImage.image = UIImage(named: "snb_menu_alarm_black.png")
        
        noticeView.backgroundColor = grayColor
        noticeText.textColor = whiteColor
        noticeText1.textColor = whiteColor
        noticeImage.image = UIImage(named: "snb_menu_notice.png")
        
        couponView.backgroundColor = grayColor
        couponText.textColor = whiteColor
        couponImage.image = UIImage(named: "snb_menu_coupon.png")
        
        cancelView.backgroundColor = grayColor
        cancelText.textColor = whiteColor
        cancelImage.image = UIImage(named: "snb_menu_cancel.png")
        
        csView.backgroundColor = grayColor
        csText.textColor = whiteColor
        csImage.image = UIImage(named: "snb_menu_cs.png")
        
        coopbrandView.backgroundColor = grayColor
        coopbrandText.textColor = whiteColor
        coopbrandImage.image = UIImage(named: "snb_menu_coopbrand.png")
    }
    
    @IBAction func noticeButtonClick(_ sender: UIButton) {
        alarmContentsView.isHidden = true
        noticeContentsView.isHidden = false
        couponContentsView.isHidden = true
        cancelContentsView.isHidden = true
        csContentsView.isHidden = true
        coopbrandContentsView.isHidden = true
            
        alarmView.backgroundColor = grayColor
        alarmText.textColor = whiteColor
        alarmImage.image = UIImage(named: "snb_menu_alarm.png")
        
        noticeView.backgroundColor = whiteColor
        noticeText.textColor = grayColor
        noticeText1.textColor = grayColor
        noticeImage.image = UIImage(named: "snb_menu_notice_black.png")
        
        couponView.backgroundColor = grayColor
        couponText.textColor = whiteColor
        couponImage.image = UIImage(named: "snb_menu_coupon.png")
        
        cancelView.backgroundColor = grayColor
        cancelText.textColor = whiteColor
        cancelImage.image = UIImage(named: "snb_menu_cancel.png")
        
        csView.backgroundColor = grayColor
        csText.textColor = whiteColor
        csImage.image = UIImage(named: "snb_menu_cs.png")
        
        coopbrandView.backgroundColor = grayColor
        coopbrandText.textColor = whiteColor
        coopbrandImage.image = UIImage(named: "snb_menu_coopbrand.png")
    }
    
    @IBAction func couponButtonClick(_ sender: UIButton) {
        alarmContentsView.isHidden = true
        noticeContentsView.isHidden = true
        couponContentsView.isHidden = false
        cancelContentsView.isHidden = true
        csContentsView.isHidden = true
        coopbrandContentsView.isHidden = true
            
        alarmView.backgroundColor = grayColor
        alarmText.textColor = whiteColor
        alarmImage.image = UIImage(named: "snb_menu_alarm.png")
        
        noticeView.backgroundColor = grayColor
        noticeText.textColor = whiteColor
        noticeText1.textColor = whiteColor
        noticeImage.image = UIImage(named: "snb_menu_notice.png")
        
        couponView.backgroundColor = whiteColor
        couponText.textColor = grayColor
        couponImage.image = UIImage(named: "snb_menu_coupon_black.png")
        
        cancelView.backgroundColor = grayColor
        cancelText.textColor = whiteColor
        cancelImage.image = UIImage(named: "snb_menu_cancel.png")
        
        csView.backgroundColor = grayColor
        csText.textColor = whiteColor
        csImage.image = UIImage(named: "snb_menu_cs.png")
        
        coopbrandView.backgroundColor = grayColor
        coopbrandText.textColor = whiteColor
        coopbrandImage.image = UIImage(named: "snb_menu_coopbrand.png")
    }
    
    @IBAction func cancleButtonClick(_ sender: UIButton) {
        alarmContentsView.isHidden = true
        noticeContentsView.isHidden = true
        couponContentsView.isHidden = true
        cancelContentsView.isHidden = false
        csContentsView.isHidden = true
        coopbrandContentsView.isHidden = true
            
        alarmView.backgroundColor = grayColor
        alarmText.textColor = whiteColor
        alarmImage.image = UIImage(named: "snb_menu_alarm.png")
        
        noticeView.backgroundColor = grayColor
        noticeText.textColor = whiteColor
        noticeText1.textColor = whiteColor
        noticeImage.image = UIImage(named: "snb_menu_notice.png")
        
        couponView.backgroundColor = grayColor
        couponText.textColor = whiteColor
        couponImage.image = UIImage(named: "snb_menu_coupon.png")
        
        cancelView.backgroundColor = whiteColor
        cancelText.textColor = grayColor
        cancelImage.image = UIImage(named: "snb_menu_cancel_black.png")
        
        csView.backgroundColor = grayColor
        csText.textColor = whiteColor
        csImage.image = UIImage(named: "snb_menu_cs.png")
        
        coopbrandView.backgroundColor = grayColor
        coopbrandText.textColor = whiteColor
        coopbrandImage.image = UIImage(named: "snb_menu_coopbrand.png")
    }
    
    @IBAction func csButtonClick(_ sender: UIButton) {
        alarmContentsView.isHidden = true
        noticeContentsView.isHidden = true
        couponContentsView.isHidden = true
        cancelContentsView.isHidden = true
        csContentsView.isHidden = false
        coopbrandContentsView.isHidden = true
            
        alarmView.backgroundColor = grayColor
        alarmText.textColor = whiteColor
        alarmImage.image = UIImage(named: "snb_menu_alarm.png")
        
        noticeView.backgroundColor = grayColor
        noticeText.textColor = whiteColor
        noticeText1.textColor = whiteColor
        noticeImage.image = UIImage(named: "snb_menu_notice.png")
        
        couponView.backgroundColor = grayColor
        couponText.textColor = whiteColor
        couponImage.image = UIImage(named: "snb_menu_coupon.png")
        
        cancelView.backgroundColor = grayColor
        cancelText.textColor = whiteColor
        cancelImage.image = UIImage(named: "snb_menu_cancel.png")
        
        csView.backgroundColor = whiteColor
        csText.textColor = grayColor
        csImage.image = UIImage(named: "snb_menu_cs_black.png")
        
        coopbrandView.backgroundColor = grayColor
        coopbrandText.textColor = whiteColor
        coopbrandImage.image = UIImage(named: "snb_menu_coopbrand.png")
    }
    
    @IBAction func coopbrandButtonClick(_ sender: UIButton) {
        alarmContentsView.isHidden = true
        noticeContentsView.isHidden = true
        couponContentsView.isHidden = true
        cancelContentsView.isHidden = true
        csContentsView.isHidden = true
        coopbrandContentsView.isHidden = false
            
        alarmView.backgroundColor = grayColor
        alarmText.textColor = whiteColor
        alarmImage.image = UIImage(named: "snb_menu_alarm.png")
        
        noticeView.backgroundColor = grayColor
        noticeText.textColor = whiteColor
        noticeText1.textColor = whiteColor
        noticeImage.image = UIImage(named: "snb_menu_notice.png")
        
        couponView.backgroundColor = grayColor
        couponText.textColor = whiteColor
        couponImage.image = UIImage(named: "snb_menu_coupon.png")
        
        cancelView.backgroundColor = grayColor
        cancelText.textColor = whiteColor
        cancelImage.image = UIImage(named: "snb_menu_cancel.png")
        
        csView.backgroundColor = grayColor
        csText.textColor = whiteColor
        csImage.image = UIImage(named: "snb_menu_cs.png")
        
        coopbrandView.backgroundColor = whiteColor
        coopbrandText.textColor = grayColor
        coopbrandImage.image = UIImage(named: "snb_menu_coopbrand_black.png")
    }
    
    @IBAction func closeSidemenuButtonClick(_ sender: UIButton) {
        removeFromSuperview();
    }
    
    
    

    

       
    
}
