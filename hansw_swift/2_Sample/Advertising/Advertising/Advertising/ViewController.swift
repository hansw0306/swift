//
//  ViewController.swift
//  Advertising
//
//  Created by SANGWON HAN on 2020/09/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bigMenu1: UIView!
    var mCommunicationAPI: CommunicationAPI!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //메인화면에 네비게이션 지워주자
        navigationController?.navigationBar.isHidden = true
        
        //UIView부분의 이벤트 추가
        let bigMenu1taps = UITapGestureRecognizer(target: self, action: Selector(("bigMenu1TapGesture")))
        self.bigMenu1.addGestureRecognizer(bigMenu1taps)
    }

}

extension ViewController {
    
    func bigMenu1TapGesture(recognizer: UITapGestureRecognizer) {
        print("Touch bigMenu1")
        //객채를 생성 -> 화면 이동
        if let controller = storyboard?.instantiateViewController(withIdentifier: "MainTableViewController"){
            navigationController?.pushViewController(controller, animated: true)
        }
        
    }
}
