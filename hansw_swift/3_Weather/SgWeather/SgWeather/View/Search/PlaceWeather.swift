//
//  PlaceWeather.swift
//  SgWeather
//
//  Created by SANGWON HAN on 2021/11/23.
//

import UIKit

class PlaceWeather: NSObject {
    
    
    //MARK: - 데이터 가져오기
    //MARK: 동내예보
    func getWeatherForecast(mPlaceStr: String, mNX: String, mNY: String)
    {
        guard let placeUrlStr = mCommunicationObj?.makeUrlPlace(str: "동네예보조회", nx: mNX, ny: mNY)
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
                        let fcstDate = weatherData?["fcstDate"] as! String
                        let fcstTime = weatherData?["fcstTime"] as! String
                        
                        let fcst = fcstDate + " " + fcstTime
                        
                        print("\(mPlaceStr) 동네예보 날씨|| 날짜 :\(fcst)  category: \(category), fcstValue:\(fcstValue)")
                        
                        
                        
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
    //MARK: 초단기실황조회
    func getWeather(mPlaceStr: String, mNX: String, mNY: String)
    {
        
        //guard let placeUrlStr = mCommunicationObj?.makeUrlPlace(str: "초단기예보조회", nx: nx, ny: ny)
        guard let placeUrlStr = mCommunicationObj?.makeUrlPlace(str: "초단기실황조회", nx: mNX, ny: mNY)
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
                        //let fcstValue = weatherData?["fcstValue"]
                        let obsrValue = weatherData?["obsrValue"]
                        
                        
                        print("\(mPlaceStr) 초단기실황조회 날씨  category: \(category), fcstValue:\(obsrValue)")
                        
                        
                        
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
