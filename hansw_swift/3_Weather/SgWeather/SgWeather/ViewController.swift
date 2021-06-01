//
//  ViewController.swift
//  SgWeather
//
//  Created by SANGWON HAN on 2021/05/09.
//

import UIKit

class ViewController: UIViewController {

    //대표 날씨정보
    struct mainViewText {
        private var placeName : String?
        private var placeWeatherStr : String? //날씨 상태(ex 맑음,청명,흐림)
        private var placeWeatherNum : String? //날씨 기온(ex 11º)
    }
    //금일 시간편
    //금일 상세정보
    //설명,일출, 일몰, 비올 확률, 습도, 바람, 체감, 강수량, 기압, 가시거리, 자외선 지수
    
    private var mCommunicationObj : Communication?
    private var mDBManager: DBManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //날씨정보 가져오기
//        mCommunicationObj = Communication.init()
//        mCommunicationObj?.httpJson(pageInt: "1", completion: { (result, error) in
//            if let result = result {
//                print("success: \(result)")
//            }
//        })
        
        
        let fileManager = FileManager.default
        let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        print(documentURL)
        
        //DB테스트
//        mDBManager = DBManager.init()
//        mDBManager?.selectPlace(palceStr: "서울특별시")
        
    }


}

