//
//  NativeFunc.swift
//  moveViewTest
//
//  Created by SANGWON HAN on 2020/06/05.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

import UIKit
import Foundation
import MessageUI

//생체 인식에 필요
import LocalAuthentication

class NativeFuc: NSObject {
    
    //MARK:-
    //MARK: 화면이동 함수
    // 스토리 보드내의 Viwe 이동함수
    func XibViewMove (storyboard:UIStoryboard ,viewName: String)
    {
        let viewController = UIApplication.shared.windows.first!.rootViewController as! ViewController
        let controller = storyboard.instantiateViewController(withIdentifier: viewName)
        viewController.navigationController?.pushViewController(controller, animated: true)

    }
    // 스토리 보드 밖에 있는 View 이동함수
    func ExXibViewMove(viewCont : UIViewController, modalPresentationStyle: Int) {
        
        //let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        
        let viewController = UIApplication.shared.windows.first!.rootViewController as! ViewController
        viewCont.modalPresentationStyle = UIModalPresentationStyle(rawValue: modalPresentationStyle)!;
        viewController.present(viewCont, animated: true, completion: nil)
        
    }
    
    // 이전화면으로 가기
    func back( mViewCon : UIViewController) {
        if mViewCon.presentingViewController != nil {
            mViewCon.dismiss(animated: true, completion: nil)
        } else {
            mViewCon.navigationController?.popViewController(animated: true)
        }
    }
    
    
    // 현제의 화면에서 사이드메뉴 화면 띄우기
    func leftShowView(storyboard:UIStoryboard, presentVC:UIViewController ) {
            // 사이드 메뉴 띄우기
            let sidemenuVC = storyboard.instantiateViewController(withIdentifier: "SidemenuVC") as! SidemenuViewController
            presentVC.addChild(sidemenuVC)
            sidemenuVC.view.frame = presentVC.view.frame
            presentVC.view.addSubview(sidemenuVC.view)
            sidemenuVC.didMove(toParent: presentVC)
    }
    
    
    
    //MARK:-
    //MARK:네이티브 기능 호출 부분
    //MARK:1. 생체 인식 (리턴 부분 테스트 해야함)
    func BioAuth()->String {
        // LAContext Instance creation
        let authContext = LAContext()
        
        // Error store variable
        var error: NSError?
        
        // Check if the device has finger print sensor
        guard authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            print("지문인식 안되는 장치 처리")
            print(error!)
            return "\(String(describing: error))"
        }
        
        authContext.evaluatePolicy(.deviceOwnerAuthentication,
                                   localizedReason: "홈 버튼에 손가락을 올려주세요.",
                                   reply: { success, error in
            if success {
                // Fingerprint recognized
                print("지문인증 성공 or 암호인증 성공")
            }
            else {
                if let error = error {
                    print(error.localizedDescription)
                    print("에러")
                }
                print("취소")
            }
        })
        return ""
    }
    
    //MARK:-
    //MARK:그 외
    //MARK:saveValue loadValue removeValue
    let myUserDefaults = UserDefaults.standard

    func saveValue(value:String,key:String) {
        myUserDefaults.set(value, forKey: key)
    }
    
    func loadValue(key:String)->String {
        
        return myUserDefaults.string(forKey: key)!
    }
    
    func removeValue(key:String) {
        myUserDefaults.removeObject(forKey: key)
    }
    
    
    //MARK:10. 비동기 처리
    func Asynchronous()  {
        
        //비동기 처리1 GCD
        DispatchQueue.main.async {
            //내부적으로 스레드에 직접 겁근 없이 비동기 처리
        }
        
        //비동기 처리2
        OperationQueue().addOperation{
            //다른 스레드에서 아래의 로직을 처림함 (비동기)
            self.download()
        }
        OperationQueue.main.addOperation {
            //메인스레드에서 처리
        }
        
        
        //설명 및 테스트
        DispatchQueue.global().sync { print("1") }
        print("2")
        DispatchQueue.global().sync {
            sleep(2)
            print("3")
        }
        DispatchQueue.main.async { print("4") }
        DispatchQueue.global(qos: .background).async { print("5") }
        DispatchQueue.global(qos: .userInteractive).async { print("6") }
        print("7")
        
        /*
          sync는 작업이 끝나야 return
          async는 작업을 전달하자마자 return
         "1" 무조건 1등으로 출력된다. 왜냐면 sync로 추가했기 때문에 1이 출력되기 전까지 다음문장으로 넘어가지 않는다.
         "2" 무조건 1다음으로 출력된다.
         "3" "2"가 출력된 뒤, 2초 뒤에 출력된다. (만약에 sync가 아닌 async였다면 "3"은 무조건!! 꼴지로 출력된다.)
         "4" 5와 6과의 관계는 알 수 없지만 확실한건 "7"보다는 늦게 출력된다. 왜냐하면 "4"를 메인스레드에 추가하기 전에 "7"을 출력하는 작업이 이미 추가되어 있고, 메인스레드는 Serial큐이기 때문이다.
         "5", "6" 서로 다른 Concurrent큐에 async로 추가되었다. 따라서, 출력되는 순서는 장담할 수 없다.
         "7" 3보다는 늦게 출력되고 4보다는 먼저 출력된다. 무조건!!
         */
        
    }

        
    
    
func download(){
    
    guard let url : URL = URL.init(string: "https://www.google.co.kr/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png") else {
        return
    }
    
    var imageData:Data
    do {
        imageData = try Data.init(contentsOf:url)
    } catch  {
        return
    }
    
    let image: UIImage = UIImage(data: imageData)!
    print(image)
    
    
    }
    
    
    
}
//MARK:- Another Class

//MARK: 메일 보내기
class MyPageViewController: UIViewController , MFMailComposeViewControllerDelegate{
    
    func sentMail(viewCon:UIViewController) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            viewCon.present(mailComposeViewController, animated: true, completion: nil)
            print("can send mail")
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["hansw0306@gmail.com"])
        mailComposerVC.setSubject("한상원 IOS 문의 메일")
        mailComposerVC.setMessageBody("여러분의 소중한 의견 감사드립니다. \n - 한상원 -", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "메일을 전송 실패", message: "아이폰 이메일 설정을 확인하고 다시 시도해주세요.", delegate: self, cancelButtonTitle: "확인")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismiss(animated: true, completion: nil)
    }
}



//MARK: objetive_c class

//0. Objetive c 클래스를 확장하는 방법
//@objc class MobileLibrary:NSObject
//{
//    func MobilePrint() {
//
//        print("hansw Test")
//
//    }
//
//}

//1. Bridg header를 이용하여 Objetive c 소스를 그대로 사용한다.
class objClass: NSObject {
    let objLib = MobileLibrary()
    func objeFucn()  {
        objLib.nsLogPrint()
    }
}


