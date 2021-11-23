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
        
        //날씨정보 가져오기(통신)관련 객체
        mCommunicationObj = Communication.init()
        
        
    }

//MARK:- Action
    @IBAction func searchAction(_ sender: Any) {
        let searchViewCon = SearchPlaceTableViewController.init()
        searchViewCon.delegate = self
        present(searchViewCon, animated: true, completion: nil)
    }
    
    
//MARK:- SearchTableDelegate(검색장소로 데이터 가져오기)
    func Place(placeStr: String, nx: String, ny: String)
    {
        //동내예보
        self.getWeatherForecast(mPlaceStr: placeStr, mNX: nx, mNY: ny)
        //
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
