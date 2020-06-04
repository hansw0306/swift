//
//  ViewController.swift
//  moveViewTest
//
//  Created by SANGWON HAN on 2020/05/28.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //이메일 주소
    @IBOutlet var idLable: UITextField!
    //비밀번호
    @IBOutlet var passWordLable: UITextField!
    //비밀번호 보기 버튼
    @IBOutlet var passWordLookButton: UIButton!
    //자동로그인 버튼
    @IBOutlet var autoLoginButton: UIButton!
    //로그인 버튼
    @IBOutlet var loginButton: UIButton!
    //계정생성 버튼
    @IBOutlet var accountCreationButton: UIButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//---------------객체 초기 설정-----------------

//1. 입력창 설정
        //비밀번호는 안보이도록 가려주도록 하자.
        passWordLable.isSecureTextEntry = true;
        
//2. 버튼 설정
        //테두리 그리기
        loginButton.layer.borderColor = UIColor.blue.cgColor
        loginButton.layer.borderWidth = 2
        accountCreationButton.layer.borderColor = UIColor.blue.cgColor
        accountCreationButton.layer.borderWidth = 2
        
        
        //버튼의 모서리 부분을 둥글게 처리
        loginButton.layer.cornerRadius = 10
        accountCreationButton.layer.cornerRadius = 10
        
//-------------------------------------------
        
        //chevron.down.square
        //버튼 관련 작업


        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        //화면이 눌렸을때 키보드를 내려주도록 한다.
          self.view.endEditing(true)
    }


    
    
    
// MARK: -
// MARK: 이벤트
    @IBAction func LoginButtonAction(_ sender: Any) {
        
        
        print("로그인 버튼 눌림")
        if let mainViewCon = storyboard?.instantiateViewController(withIdentifier: "MainView") as? MainViewController
               {
                   //vc는 DetailViewController 객체로 객체의 selectedImage에
                   navigationController?.pushViewController(mainViewCon, animated: true)
               }
    }
    
    @IBAction func passWordLookButtonActopm(_ sender: Any) {

        
        //chevron.down.square.fill
    }
    
    
    
    @IBAction func autoLoginButtonAction(_ sender: Any) {
        
        
    }
    
    
// MARK: -
// MARK: 함수
    // Xib를 이동 함수
    func XibViewMove (_ viewName: String)
    {
        //객채를 생성
        let controller = UIViewController(nibName: viewName, bundle: nil)
        //화면 이동
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
}

