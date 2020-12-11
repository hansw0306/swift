//
//  common.swift
//  Advertising
//
//  Created by SANGWON HAN on 2020/10/22.
//

import UIKit

class common: NSObject {

    //MARK:- 화면관련
     
    //MARK:0. 최상위 viewController
    var topNativeViewCon = UIViewController.init()
    
    
    func topViewCon() -> UIViewController? {
        
        if let keyWindow = UIApplication.shared.keyWindow{
            if var viewController = keyWindow.rootViewController{
                while viewController.presentedViewController != nil {
                    viewController = viewController.presentedViewController!
                }
                print("[topViewCon] : \(String(describing:viewController))")
                topNativeViewCon = viewController
                return viewController
            }
        }
        return nil
    }
    
    
    //MARK:1 스토리 보드내의 Viwe 이동함수
    func XibViewMove (storyboard:UIStoryboard ,viewName: String)
    {
        let viewController = UIApplication.shared.windows.first!.rootViewController as! ViewController
        let controller = storyboard.instantiateViewController(withIdentifier: viewName)
        viewController.navigationController?.pushViewController(controller, animated: true)

    }
    //MARK:2 스토리 보드 밖에 있는 View 이동함수
    func ExXibViewMove(viewCont : UIViewController, overFullScreen: Bool) {
        //let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        
        let viewController = UIApplication.shared.windows.first!.rootViewController!
        //modalPresentationStyle는 .overFullScreen
        if overFullScreen{
            viewCont.modalPresentationStyle = UIModalPresentationStyle(rawValue: 5)!;
        }
        viewController.present(viewCont, animated: true, completion: nil)
        
    }
    //MARK:-
    
}
