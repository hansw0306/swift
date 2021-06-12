//
//  ViewController.swift
//  SgWeather
//
//  Created by SANGWON HAN on 2021/05/09.
//

import UIKit

class ViewController: UIViewController,SearchTableDelegate {

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
        mCommunicationObj = Communication.init()
        mCommunicationObj?.httpJson(pageInt: "1", completion: {(result, error) in
            if let result = result {
                print("success: \(result)")
            }
        })
        
    }

//MARK:- Action
    @IBAction func searchAction(_ sender: Any) {
        let searchViewCon = TableViewController.init()
        searchViewCon.delegate = self
        present(searchViewCon, animated: true, completion: nil)
    }
    
    
//MARK:- SearchTableDelegate(검색부분 델리게이터)
    func Place(placeStr: String) {
        
        print(placeStr)
    }
}

//MARK:- extension
extension ViewController{
    
    func saveDefaults(){
        //데이터 저장
        UserDefaults.standard.set("key", forKey: "CustomKey") // Save
        UserDefaults.standard.value(forKey: "CustomKey") // Load
        UserDefaults.standard.removeObject(forKey: "")
        
        let value : Dictionary<String, Any>
        value = ["sss":"ssss"]
        UserDefaults.standard.set(value, forKey: "to")
        
    }
    
    //데이터 전부 지우기
    func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}
