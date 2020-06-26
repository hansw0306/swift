//
//  SidemenuCoopbrandViewController.swift
//  puts
//
//  Created by 최다영 on 2018. 8. 17..
//  Copyright © 2018년 컴퓨터. All rights reserved.
//

import UIKit
protocol SidemenuCoopbrandVCDelegate {
    func moveToPage()
}
class SidemenuCoopbrandViewController: UIView {
    @IBOutlet weak var alphabetView: UIView!
    @IBOutlet weak var koreanView: UIView!
    @IBOutlet weak var classificationView: UIView!
    @IBOutlet weak var popularView: UIView!
    @IBOutlet weak var pickLayoutView: UIView!
    @IBOutlet weak var layoutListView: UIView!
    @IBOutlet weak var pickLayoutImage: UIImageView!
    @IBOutlet weak var layoutImage1: UIImageView!
    @IBOutlet weak var layoutImage2: UIImageView!
    @IBOutlet weak var layoutImage3: UIImageView!
    @IBOutlet weak var layoutImage4: UIImageView!
    
    var delegate: SidemenuCoopbrandVCDelegate?
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "SidemenuCoopbrand", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    @IBAction func searchAlphabetButtoinClick(_ sender: UIButton) {
        alphabetView.isHidden = false
        koreanView.isHidden = true
        classificationView.isHidden = true
        popularView.isHidden = true
    }
    
    @IBAction func searchKoreanButtonClick(_ sender: UIButton) {
        alphabetView.isHidden = true
        koreanView.isHidden = false
        classificationView.isHidden = true
        popularView.isHidden = true
    }
    
    @IBAction func searchClassificationButtonClick(_ sender: UIButton) {
        alphabetView.isHidden = true
        koreanView.isHidden = true
        classificationView.isHidden = false
        popularView.isHidden = true
    }
    
    @IBAction func searchPopularButtonClick(_ sender: UIButton) {
        alphabetView.isHidden = true
        koreanView.isHidden = true
        classificationView.isHidden = true
        popularView.isHidden = false
    }
    
    //픽업리스트 레이아웃 종류 띄우기
    @IBAction func pickLayoutButtonClick(_ sender: UIButton) {
        pickLayoutView.isHidden = true
        layoutListView.isHidden = false
    }
    //픽업리스트 레이아웃 선택
    @IBAction func layoutImage1ButtonClick(_ sender: UIButton) {
        pickLayoutImage.image = UIImage(named: "order_btn1.png")
        layoutImage1.isHidden = false
        layoutImage2.isHidden = true
        layoutImage3.isHidden = true
        layoutImage4.isHidden = true
        
        layoutListView.isHidden = true
        pickLayoutView.isHidden = false
    }
    
    @IBAction func layoutImage2ButtonClick(_ sender: UIButton) {
        pickLayoutImage.image = UIImage(named: "order_btn2.png")
        layoutImage1.isHidden = true
        layoutImage2.isHidden = false
        layoutImage3.isHidden = true
        layoutImage4.isHidden = true
        
        layoutListView.isHidden = true
        pickLayoutView.isHidden = false
    }
    
    
    
    
    @IBAction func layoutImage3ButtonClick(_ sender: UIButton) {
        pickLayoutImage.image = UIImage(named: "order_btn3.png")
        layoutImage1.isHidden = true
        layoutImage2.isHidden = true
        layoutImage3.isHidden = false
        layoutImage4.isHidden = true
        
        layoutListView.isHidden = true
        pickLayoutView.isHidden = false
    }
    
    @IBAction func layoutImage4ButtonClick(_ sender: UIButton) {
        pickLayoutImage.image = UIImage(named: "order_btn4.png")
        layoutImage1.isHidden = true
        layoutImage2.isHidden = true
        layoutImage3.isHidden = true
        layoutImage4.isHidden = false
        
        layoutListView.isHidden = true
        pickLayoutView.isHidden = false
    }
    
    @IBAction func bookmarkSettingButtonClick(_ sender: Any) {
        print("gg")
        delegate?.moveToPage()
    }
   
    
   
}

