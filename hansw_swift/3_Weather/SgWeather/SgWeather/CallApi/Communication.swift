//
//  Communication.swift
//  SgWeather
//
//  Created by SANGWON HAN on 2021/05/18.
//

import UIKit
import WebKit
class Communication: NSObject {
    
    let session = URLSession.shared
    let infoDic = Bundle.main.infoDictionary!
    


}


extension Communication {
    
    func httpJson(pageInt:String, completion: @escaping ([AnyHashable : Any]?, Error?) -> Void) {
        let urlStr = self.makeUrlPlace(str: "중기전망조회")
        let url = NSURL(string: urlStr)
        
        //Task
        let task = session.dataTask(with: url! as URL, completionHandler: {
            (data, response, error) -> Void in
            
            if (data == nil){
                print("결과값이 없음")
                return
            }
            
            if let nsstr = NSString(data:data!, encoding: String.Encoding.utf8.rawValue){
                let str = String(nsstr)
                print("통신후 결과값 Str : \(str)")
                
                do {
                    let dic = try JSONSerialization.jsonObject(
                        with: str.data(using: String.Encoding.utf8)!,
                        options:JSONSerialization.ReadingOptions.mutableContainers)
                        as! NSDictionary
                    
                    //통신하여 가져온 정보를 전달
                    completion(dic as? [AnyHashable : Any], nil)
                } catch {
                    print("error occured")
                }
            }
        })
        //Task Resume
        task.resume()
    }
    
    //MARK: -
    
    //MARK: 동네예보 URL
    func makeUrlPlace(str:String) -> String {
        let url = "http://apis.data.go.kr/1360000/VilageFcstInfoService"
        let KeyString = infoDic["APIKey_Place"] as! String
        var urlParam = ""
        
        urlParam = "/getVilageFcst?ServiceKey=\(KeyString)&pageNo=1&numOfRows=10&dataType=JSON&base_date=20210522&base_time=0500&nx=60&ny=127"
        
        return url+urlParam
    }
    
    
    
    
    //MARK: 중기예보 URL
    func makeUrlJungGi(str:String) -> String {
        
        let url = "http://apis.data.go.kr/1360000/MidFcstInfoService"
        let KeyString = infoDic["APIKey_Mid-term forecast"] as! String
        var urlParam = ""
        if str == "중기전망조회"{
            /*
             페이지 번호(pageNo)
             한 페이지 결과 수(numOfRows)
             응답자료형식(dataType)
             지점번호(stnId)
             108: 전국 109: 서울, 인천, 경기도 105: 강원도 131: 충청북도 133: 대전, 세종, 충청남도 146: 전라북도
             156: 광주, 전라남도 143: 대구, 경상북도 159: 부산, 울산, 경상남도 184: 제주도
             발표시각(tmFc) : 201310170600 일 2회(06:00,18:00)회 생성 되며 발표시각을 입력-최근 24시간 자료만 제공
             */
            urlParam = "/getMidFcst?ServiceKey=\(KeyString)&pageNo=1&numOfRows=10&dataType=JSON&stnId=108&tmFc=202105220600"
        }
        else if str == "중기육상예보조회"{
            /*
             한 페이지 결과 수 (numOfRows)
             페이지 번호 (pageNo)
             응답자료형식 (dataType)
             예보구역코드 (regId)
             발표시각 (tmFc)
             */
            urlParam = "/getMidLandFcst?ServiceKey=\(KeyString)&pageNo=1&numOfRows=10&dataType=JSON&regId=12A20000&tmFc=202105220600"
        }
        else if str == "중기기온조회"{
            /*
             한 페이지 결과 수 (numOfRows)
             페이지 번호 (pageNo)
             응답자료형식 (dataType)
             예보구역코드 (regId)
             발표시각 (tmFc)
             */
            urlParam = "/getMidTa?ServiceKey=\(KeyString)&pageNo=1&numOfRows=10&dataType=JSON&regId=12A20000&tmFc=202105220600"
            
        }
        else if str == "중기해상예보조회"{
            urlParam = "/getMidSeaFcst?ServiceKey=\(KeyString)&pageNo=1&numOfRows=10&dataType=JSON&regId=12A20000&tmFc=202105220600"
        }
        return url+urlParam
    }
    
}
