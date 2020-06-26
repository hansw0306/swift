//
//  SidemenuCsWriteViewController.swift
//  puts
//
//  Created by 최다영 on 2018. 8. 29..
//  Copyright © 2018년 컴퓨터. All rights reserved.
//

import UIKit
class SidemenuCsWriteViewController: UIView {
    @IBOutlet weak var secretButton: UIButton!
    var isSecretCheck = false
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "SidemenuCsWrite", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    @IBAction func backButtonClick(_ sender: UIButton) {
        removeFromSuperview();
    }
    @IBAction func secretButtonClick(_ sender: UIButton) {
     
        if isSecretCheck == false  {
            secretButton.setImage(#imageLiteral(resourceName: "secret_check"), for: UIControl.State.normal)
            isSecretCheck = true
        }else{
            secretButton.setImage(#imageLiteral(resourceName: "secret_nocheck"), for: UIControl.State.normal)
            isSecretCheck = false
        }
    }
    
}
