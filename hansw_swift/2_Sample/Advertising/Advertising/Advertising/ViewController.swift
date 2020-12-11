//
//  ViewController.swift
//  Advertising
//
//  Created by SANGWON HAN on 2020/09/26.
//

import UIKit

class ViewController: UIViewController {

    let commonObj = common()
    @IBOutlet var bigMenu1: UIView!
    @IBOutlet var bigMenu2: UIView!
    var mCommunicationAPI: CommunicationAPI!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //메인화면에 네비게이션 지워주자
        navigationController?.navigationBar.isHidden = true
        
        //UIView부분의 이벤트 추가
        let bigMenu1Gesture = UITapGestureRecognizer(target: self, action:  #selector(self.bigMenu1TapGesture))
        self.bigMenu1.addGestureRecognizer(bigMenu1Gesture)
        
        let bigMenu2Gesture = UITapGestureRecognizer(target: self, action:  #selector(self.bigMenu2TapGesture))
        self.bigMenu2.addGestureRecognizer(bigMenu2Gesture)
    }

}

extension ViewController {
    
    //이벤트
    @objc func bigMenu1TapGesture(sender : UITapGestureRecognizer) {
        print("Touch bigMenu1")
        //객채를 생성 -> 화면 이동
        if let controller = storyboard?.instantiateViewController(withIdentifier: "MainTableViewController"){
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    @objc func bigMenu2TapGesture(sender : UITapGestureRecognizer) {
        print("Touch bigMenu2")
        //객채를 생성 -> 화면 이동
        //print("선택 셀 \([indexPath.row])")
        let mainDetailVC = MainTableDetailViewController.init()
        //mainDetailVC.lable.text = "선택셀 \([indexPath.row])"
        commonObj.ExXibViewMove(viewCont: mainDetailVC, overFullScreen: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    
}
