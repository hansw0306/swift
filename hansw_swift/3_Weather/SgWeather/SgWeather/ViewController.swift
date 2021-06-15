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
    func Place(placeStr: String, nx: String, ny: String) {
        
        //guard let placeUrlStr = mCommunicationObj?.makeUrlPlace(str: "초단기실황조회", nx: nx, ny: ny)
        guard let placeUrlStr = mCommunicationObj?.makeUrlPlace(str: "초단기예보조회", nx: nx, ny: ny)
        //guard let placeUrlStr = mCommunicationObj?.makeUrlPlace(str: "동네예보", nx: nx, ny: ny)
        else {
            print("동네예보 URL을 만들기 실패하였습니다.");
            return
            
        }
        //데이터가져오기
        mCommunicationObj?.httpJson(mPlaceUrl: placeUrlStr, completion: {(result, error) in
            if let resultJson = result {
                //print("success: \(resultJson)")
                
                let resultJsonSub = resultJson["response"] as! Dictionary<String, Any>
                let inJsonHeader = resultJsonSub["header"] as! Dictionary<String, Any>
                let resultCode = inJsonHeader["resultCode"] as! String
                
                if(resultCode == "00")
                {
                    
                    let inJsonBody = resultJsonSub["body"] as! Dictionary<String, Any>
                    let inBodyitems = inJsonBody["items"] as! Dictionary<String, Any>
                    let itemArray :NSArray =  inBodyitems["item"] as! NSArray
                    
                    print(itemArray.count)
                    for placeData in itemArray
                    {
                        let weatherData = placeData as? Dictionary<String,Any>
                        let category = weatherData?["category"]
                        let fcstValue = weatherData?["fcstValue"]
                        let obsrValue = weatherData?["obsrValue"]
                        
                        if(fcstValue != nil)
                        {
                            print("\(placeStr) 동네예보 날씨  category: \(category), fcstValue:\(fcstValue)")
                        }
                        else if(obsrValue != nil)
                        {
                            print("\(placeStr) 초단기실황조회 날씨  category: \(category), fcstValue:\(obsrValue)")
                        }
                        
                        
                        /*
                         POP : 강수확률 %
                         PTY : 강수형태 (코드값)
                         REH : 습도 %
                         SKY : 하늘상태 (코드값)
                                0 ～ 5(맑음)
                                6 ～ 8(구름많음)
                                9 ～ 10(흐림)
                         T3H : 3시간 기온 ℃
                         
                         TMN : 아침 최저기온
                         TMX : 낮 최고기온
                         R06 : 6시간 강수량
                         S06 : 6시간 신적설
                         UUU : 풍속(동서성분) m/s
                         VVV : 풍속(남북성분) m/s
                         VEC : 풍향 deg
                                0 – 45 : N-NE
                                45 – 90 NE-E
                                90 – 135    E-SE
                                135 – 180    SE-S
                                180 – 225    S-SW
                                225 – 270    SW-W
                                270 – 315    W-NW
                                315 – 360    NW-N
                         WSD : 풍속
                                <4 : 바람약하다.
                                4~9 : 바람이 약간 강하다.
                                9~14 : 바람이 강하다
                                14< : 바람이 매우강하다.
                         
                         */
                    }
                }
                else
                {
                    let resultMsg = inJsonHeader["resultMsg"] as! String
                    print("error 메시지 : \(resultMsg)")
                }
                
            }
        })
        
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
