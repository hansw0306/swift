//
//  MainTableDetailViewController.swift
//  Advertising
//
//  Created by SANGWON HAN on 2020/10/22.
//

import UIKit

class MainTableDetailViewController: UIViewController {
    
    let lable = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        
        
        // Do any additional setup after loading the view.
        lable.frame(forAlignmentRect: CGRect(x: 10, y: 10, width: 320, height: 50))
        
        //lable.text = "디테일 화면입니다."
    }

}
