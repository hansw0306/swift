//
//  SidemenuViewController.swift
//  puts
//
//  Created by SANGWON HAN on 2020/06/26.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

import Foundation
import UIKit
internal class SidemenuViewController: UIViewController{
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
    
    @IBOutlet weak var ContentsView: UIView!
    @IBOutlet weak var backgroundConstraint: NSLayoutConstraint!
    @IBOutlet weak var baseView: UIView!
    
    var coopDelegate: SidemenuCoopbrandVCDelegate?
    
    let whiteColor = UIColor.white
    let grayColor = UIColor.darkGray
    //RGB color
    let sideMenuBarColer = UIColor(red: 67.0/255, green: 122.0/255, blue: 255.0/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         coopDelegate = self
        self.view.backgroundColor = UIColor.darkGray.withAlphaComponent(0)
        showAnimate()
        
        let view = SidemenuAlarmViewController.instanceFromNib()
        ContentsView.addSubview(view)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    
    // 팝업 열기 애니메이션
    func showAnimate() {
//        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
//        self.view.alpha = 0.0
//        UIView.animate(withDuration: 0.25, animations: {
//            self.view.alpha = 1.0
//            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//        })
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundConstraint = self.backgroundConstraint.setMultiplier(multiplier: 0.05)
            self.view.layoutIfNeeded()
        },completion: nil)
    }
    // 팝업 닫기 애니메이션
    func removeAnimate() {

        UIView.animate(withDuration: 0.3, animations: {
            
            self.backgroundConstraint = self.backgroundConstraint.setMultiplier(multiplier: 1.0)
            self.view.layoutIfNeeded()
        }, completion: {(finished : Bool) in
            if(finished) {
                self.willMove(toParent: nil)
                self.view.removeFromSuperview()
                self.removeFromParent()
            }
        })
    }
    
    

    @IBAction func alarmButtonClick(_ sender: UIButton) {
        let view = SidemenuAlarmViewController.instanceFromNib()
        ContentsView.addSubview(view)
        
        
        alarmView.backgroundColor = whiteColor
        alarmText.textColor = grayColor
        alarmImage.image = UIImage(named: "snb_menu_alarm_black.png")
        
        noticeView.backgroundColor = sideMenuBarColer
        noticeText.textColor = whiteColor
        noticeText1.textColor = whiteColor
        noticeImage.image = UIImage(named: "snb_menu_notice.png")
        
        couponView.backgroundColor = sideMenuBarColer
        couponText.textColor = whiteColor
        couponImage.image = UIImage(named: "snb_menu_coupon.png")
        
        cancelView.backgroundColor = sideMenuBarColer
        cancelText.textColor = whiteColor
        cancelImage.image = UIImage(named: "snb_menu_cancel.png")
        
        csView.backgroundColor = sideMenuBarColer
        csText.textColor = whiteColor
        csImage.image = UIImage(named: "snb_menu_cs.png")
        
        coopbrandView.backgroundColor = sideMenuBarColer
        coopbrandText.textColor = whiteColor
        coopbrandImage.image = UIImage(named: "snb_menu_coopbrand.png")
    }
    
    @IBAction func noticeButtonClick(_ sender: UIButton) {
        let view = SidemenuNoticeViewController.instanceFromNib()
        ContentsView.addSubview(view)
        
        alarmView.backgroundColor = sideMenuBarColer
        alarmText.textColor = whiteColor
        alarmImage.image = UIImage(named: "snb_menu_alarm.png")
        
        noticeView.backgroundColor = whiteColor
        noticeText.textColor = grayColor
        noticeText1.textColor = grayColor
        noticeImage.image = UIImage(named: "snb_menu_notice_black.png")
        
        couponView.backgroundColor = sideMenuBarColer
        couponText.textColor = whiteColor
        couponImage.image = UIImage(named: "snb_menu_coupon.png")
        
        cancelView.backgroundColor = sideMenuBarColer
        cancelText.textColor = whiteColor
        cancelImage.image = UIImage(named: "snb_menu_cancel.png")
        
        csView.backgroundColor = sideMenuBarColer
        csText.textColor = whiteColor
        csImage.image = UIImage(named: "snb_menu_cs.png")
        
        coopbrandView.backgroundColor = sideMenuBarColer
        coopbrandText.textColor = whiteColor
        coopbrandImage.image = UIImage(named: "snb_menu_coopbrand.png")
    }
    
    @IBAction func couponButtonClick(_ sender: UIButton) {
        let view = SidemenuCouponViewController.instanceFromNib()
        ContentsView.addSubview(view)
        
        alarmView.backgroundColor = sideMenuBarColer
        alarmText.textColor = whiteColor
        alarmImage.image = UIImage(named: "snb_menu_alarm.png")
        
        noticeView.backgroundColor = sideMenuBarColer
        noticeText.textColor = whiteColor
        noticeText1.textColor = whiteColor
        noticeImage.image = UIImage(named: "snb_menu_notice.png")
        
        couponView.backgroundColor = whiteColor
        couponText.textColor = grayColor
        couponImage.image = UIImage(named: "snb_menu_coupon_black.png")
        
        cancelView.backgroundColor = sideMenuBarColer
        cancelText.textColor = whiteColor
        cancelImage.image = UIImage(named: "snb_menu_cancel.png")
        
        csView.backgroundColor = sideMenuBarColer
        csText.textColor = whiteColor
        csImage.image = UIImage(named: "snb_menu_cs.png")
        
        coopbrandView.backgroundColor = sideMenuBarColer
        coopbrandText.textColor = whiteColor
        coopbrandImage.image = UIImage(named: "snb_menu_coopbrand.png")
    }
    
    @IBAction func cancleButtonClick(_ sender: UIButton) {
        let view = SidemenuCancelViewController.instanceFromNib()
        ContentsView.addSubview(view)
        
        alarmView.backgroundColor = sideMenuBarColer
        alarmText.textColor = whiteColor
        alarmImage.image = UIImage(named: "snb_menu_alarm.png")
        
        noticeView.backgroundColor = sideMenuBarColer
        noticeText.textColor = whiteColor
        noticeText1.textColor = whiteColor
        noticeImage.image = UIImage(named: "snb_menu_notice.png")
        
        couponView.backgroundColor = sideMenuBarColer
        couponText.textColor = whiteColor
        couponImage.image = UIImage(named: "snb_menu_coupon.png")
        
        cancelView.backgroundColor = whiteColor
        cancelText.textColor = grayColor
        cancelImage.image = UIImage(named: "snb_menu_cancel_black.png")
        
        csView.backgroundColor = sideMenuBarColer
        csText.textColor = whiteColor
        csImage.image = UIImage(named: "snb_menu_cs.png")
        
        coopbrandView.backgroundColor = sideMenuBarColer
        coopbrandText.textColor = whiteColor
        coopbrandImage.image = UIImage(named: "snb_menu_coopbrand.png")
    }
    
    @IBAction func csButtonClick(_ sender: UIButton) {
        let view = SidemenuCsViewController.instanceFromNib()
        ContentsView.addSubview(view)
        
        alarmView.backgroundColor = sideMenuBarColer
        alarmText.textColor = whiteColor
        alarmImage.image = UIImage(named: "snb_menu_alarm.png")
        
        noticeView.backgroundColor = sideMenuBarColer
        noticeText.textColor = whiteColor
        noticeText1.textColor = whiteColor
        noticeImage.image = UIImage(named: "snb_menu_notice.png")
        
        couponView.backgroundColor = sideMenuBarColer
        couponText.textColor = whiteColor
        couponImage.image = UIImage(named: "snb_menu_coupon.png")
        
        cancelView.backgroundColor = sideMenuBarColer
        cancelText.textColor = whiteColor
        cancelImage.image = UIImage(named: "snb_menu_cancel.png")
        
        csView.backgroundColor = whiteColor
        csText.textColor = grayColor
        csImage.image = UIImage(named: "snb_menu_cs_black.png")
        
        coopbrandView.backgroundColor = sideMenuBarColer
        coopbrandText.textColor = whiteColor
        coopbrandImage.image = UIImage(named: "snb_menu_coopbrand.png")
    }
    
    @IBAction func coopbrandButtonClick(_ sender: UIButton) {
//        let view = SidemenuCoopbrandViewController.instanceFromNib()
//        ContentsView.addSubview(view)
        let coop = Bundle.main.loadNibNamed("SidemenuCoopbrand", owner: self, options: nil)?.first as! SidemenuCoopbrandViewController
        ContentsView.addSubview(coop)
        coop.delegate = coopDelegate
        
        alarmView.backgroundColor = sideMenuBarColer
        alarmText.textColor = whiteColor
        alarmImage.image = UIImage(named: "snb_menu_alarm.png")
        
        noticeView.backgroundColor = sideMenuBarColer
        noticeText.textColor = whiteColor
        noticeText1.textColor = whiteColor
        noticeImage.image = UIImage(named: "snb_menu_notice.png")
        
        couponView.backgroundColor = sideMenuBarColer
        couponText.textColor = whiteColor
        couponImage.image = UIImage(named: "snb_menu_coupon.png")
        
        cancelView.backgroundColor = sideMenuBarColer
        cancelText.textColor = whiteColor
        cancelImage.image = UIImage(named: "snb_menu_cancel.png")
        
        csView.backgroundColor = sideMenuBarColer
        csText.textColor = whiteColor
        csImage.image = UIImage(named: "snb_menu_cs.png")
        
        coopbrandView.backgroundColor = whiteColor
        coopbrandText.textColor = grayColor
        coopbrandImage.image = UIImage(named: "snb_menu_coopbrand_black.png")
    }

    
    @IBAction func closeSidemenuButtonClick(_ sender: UIButton) {
        removeAnimate()
    }
    
    @IBAction func backgroundSidemenuButtonClick(_ sender: UIButton) {
        removeAnimate()
    }
    
    

    
}
extension SidemenuViewController: SidemenuCoopbrandVCDelegate {
    func moveToPage(){
        //아직 추가하지 않았다..
//        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "BookmarkSettingVC") as? BookmarkSettingViewController{
//            present(vc, animated: true, completion: nil)
//
//        }
    }
}
