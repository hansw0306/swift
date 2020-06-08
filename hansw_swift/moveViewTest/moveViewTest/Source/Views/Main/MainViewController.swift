//
//  MainViewController.swift
//  moveViewTest
//
//  Created by SANGWON HAN on 2020/05/28.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "메인"
        
        if #available(iOS 13.0, *) {
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(systemName: "person.fill"),
                                                               style: .plain,
                                                               target: self,
                                                               action: #selector(LeftNavigationItemButtonAction))
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Right",
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(RightNavigationItemButtonAction))
            
            
        } else {
            // Fallback on earlier versions
        }
        
        //아래 링크의 이미지를 사용하여 화면을 꾸며주는 작업을 하도록 하지.
        //https://www.youtube.com/watch?v=k90V115zqRk
        
        //이부분도 나중에 추가 작업 진행해 보자
        //https://eastroot1590.tistory.com/entry/UICollectionView-3-실습-CardNews1?category=848449
        
        //요기 좋다
        //https://unclean.tistory.com/60?category=834416
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.hidesBarsOnTap = true
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.hidesBarsOnTap = false
//    }
    
    
    @objc func RightNavigationItemButtonAction() {
        print("네비게이션 버튼 클릭됨")
    }
    
    @objc func LeftNavigationItemButtonAction() {
        print("네비게이션 버튼 클릭됨")
    }
    
}
