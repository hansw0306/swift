//
//  ViewController.swift
//  moveViewTest
//
//  Created by SANGWON HAN on 2020/05/28.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //chevron.down.square
        //버튼 관련 작업
        //테두리 그리기
        //addClothesButton.layer.borderColor = UIColor.white.cgColor
        //addClothesButton.layer.borderWidth = 2
        
        //버튼의 모서리 부분을 둥글게 처리
        //addClothesButton.layer.cornerRadius = 10

        
    }
    

    @IBAction func LoginButtonAction(_ sender: Any) {
        
        
        print("로그인 버튼 눌림")
        if let mainViewCon = storyboard?.instantiateViewController(withIdentifier: "MainView") as? MainViewController
               {
                   //vc는 DetailViewController 객체로 객체의 selectedImage에
                   navigationController?.pushViewController(mainViewCon, animated: true)
               }
    }
    
}

