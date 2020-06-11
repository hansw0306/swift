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

    //--------------------------------------------
    
    let mCreatAccountViewController = CreatAccountViewController.init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//---------------객체 초기 설정-----------------

//1. 입력창 설정
        //비밀번호는 안보이도록 가려주도록 하자.
        passWordLable.isSecureTextEntry = true
        
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
        
#if DEBUG
        //let viewCon = SwCalender.init()
        //self.ExXibViewMove(viewCont: viewCon, modalPresentationStyle: 5)
        //self.XibViewMove("CollectionView")
#endif
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //뷰가 나오기 전에 미리 작업을 해줘야 한다 viewDidAppear에서는 순가적으로 보인다.
        if #available(iOS 11.0, *) {
            //네비게이션 바형테를 변경
            //title = "SangWon.H"
            //navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.isHidden = true
        } else {
            // Fallback on earlier versions
        }
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
        //메인 화면 이동
        self.XibViewMove("MainView")
    }
    
    @IBAction func AccountCreationButtonAction(_ sender: Any) {
        
        
        self.ExXibViewMove(viewCont: mCreatAccountViewController, modalPresentationStyle: 5)
    }
    
    
    @IBAction func passWordLookButtonActopm(_ sender: Any) {

        let backImage = passWordLookButton.backgroundImage(for: UIControl.State(rawValue: 0))
        
        if #available(iOS 13.0, *) {
            //버튼 백그라운드 이미지 이름을 확인하여 변경하는 로직
            if let imageName = (backImage?.imageAsset?.value(forKey: "assetName"))as? String {
                print(imageName)
                if imageName == "eye"{
                    passWordLookButton.setBackgroundImage(
                        UIImage.init(systemName: "eye.slash"),
                        for: UIControl.State(rawValue: 0))
                    passWordLable.isSecureTextEntry = true
                }
                else{
                    passWordLookButton.setBackgroundImage(
                        UIImage.init(systemName: "eye"),
                        for: UIControl.State(rawValue: 0))
                    passWordLable.isSecureTextEntry = false
                }
            }
        }
        else{
            
        }
        
        
        
    }
    
    
    
    @IBAction func autoLoginButtonAction(_ sender: Any) {
        let backImage = autoLoginButton.backgroundImage(for: UIControl.State(rawValue: 0))
        
        if #available(iOS 13.0, *) {
            
            //버튼 백그라운드 이미지 이름을 확인하여 변경하는 로직
            if let imageName = (backImage?.imageAsset?.value(forKey: "assetName"))as? String {
                print(imageName)

                if imageName == "chevron.down.square"
                {
                    autoLoginButton.setBackgroundImage(
                        UIImage.init(systemName: "chevron.down.square.fill"),
                        for: UIControl.State(rawValue: 0))
                }
                else
                {
                    autoLoginButton.setBackgroundImage(
                        UIImage.init(systemName: "chevron.down.square"),
                        for: UIControl.State(rawValue: 0))
                }
            }

        }
        else
        {
            
            //var uiImageView = UIImageView()
            let chevron_up: UIImage = UIImage(named: "chevron.down.square")!
            let chevron_down: UIImage = UIImage(named: "chevron.down.square.fill")!
            
            //uiImageView = UIImageView(image: image)
            
            if let imageName = (backImage?.imageAsset?.value(forKey: "assetName"))as? String {
                print(imageName)
                
                if imageName == "chevron.down.square"{
                    autoLoginButton.setBackgroundImage(
                        chevron_down,
                        for: UIControl.State(rawValue: 0))
                }
                else{
                    autoLoginButton.setBackgroundImage(
                        chevron_up,
                        for: UIControl.State(rawValue: 0))
                }
            }
            
        }
            
            
        
    }
    
    
// MARK: -
// MARK: 함수
    // 스토리 보드내의 Viwe 이동함수
    func XibViewMove (_ viewName: String)
    {
        //객채를 생성
        if let controller = storyboard?.instantiateViewController(withIdentifier: viewName){
            //화면 이동
            //navigationController?.customPopView(controller)
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    // 스토리 보드 밖에 있는 View 이동함수
    func ExXibViewMove(viewCont : UIViewController, modalPresentationStyle: Int) {
        
        viewCont.modalPresentationStyle = UIModalPresentationStyle(rawValue: modalPresentationStyle)!;
        present(viewCont, animated:true, completion: nil)
    }
    
    
    func back() {
        if presentingViewController != nil {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    
}

//네비게이션 custiomPopView
extension UINavigationController {
    func customPopView(_ viewController: UIViewController) {
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        view.layer.add(transition, forKey: nil)
        pushViewController(viewController, animated: false)
    }
}
