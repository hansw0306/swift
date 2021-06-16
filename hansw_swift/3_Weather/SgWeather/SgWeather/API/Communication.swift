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
    
    
    /*
     통신에러
     00    NORMAL_SERVICE    정상
     01    APPLICATION_ERROR    어플리케이션 에러
     02    DB_ERROR    데이터베이스 에러
     03    NODATA_ERROR    데이터없음 에러
     04    HTTP_ERROR    HTTP 에러
     05    SERVICETIME_OUT    서비스 연결실패 에러
     10    INVALID_REQUEST_PARAMETER_ERROR    잘못된 요청 파라메터 에러
     11    NO_MANDATORY_REQUEST_PARAMETERS_ERROR    필수요청 파라메터가 없음
     12    NO_OPENAPI_SERVICE_ERROR    해당 오픈API서비스가 없거나 폐기됨
     20    SERVICE_ACCESS_DENIED_ERROR    서비스 접근거부
     21    TEMPORARILY_DISABLE_THE_SERVICEKEY_ERROR    일시적으로 사용할 수 없는 서비스 키
     22    LIMITED_NUMBER_OF_SERVICE_REQUESTS_EXCEEDS_ERROR    서비스 요청제한횟수 초과에러
     30    SERVICE_KEY_IS_NOT_REGISTERED_ERROR    등록되지 않은 서비스키
     31    DEADLINE_HAS_EXPIRED_ERROR    기한만료된 서비스키
     32    UNREGISTERED_IP_ERROR    등록되지 않은 IP
     33    UNSIGNED_CALL_ERROR    서명되지 않은 호출
     99    UNKNOWN_ERROR    기타에러
     */
    
    
    
    
    
    func httpJson(mPlaceUrl:String, completion: @escaping ([String : Any]?, Error?) -> Void) {
        
        let url = NSURL(string: mPlaceUrl)
        
        //Task
        let task = session.dataTask(with: url! as URL, completionHandler: {
            (data, response, error) -> Void in
            
            if (data == nil){
                print("결과값이 없음")
                return
            }
            
            if let nsstr = NSString(data:data!, encoding: String.Encoding.utf8.rawValue){
                let str = String(nsstr)
                //print("통신후 결과값 Str : \(str)")
                
                do {
                    let dic = try JSONSerialization.jsonObject(
                        with: str.data(using: String.Encoding.utf8)!,
                        options:JSONSerialization.ReadingOptions.mutableContainers)
                        as! NSDictionary
                    
                    //통신하여 가져온 정보를 전달
                    completion(dic as! [String : Any], nil)
                } catch {
                    print("error occured")
                }
            }
        })
        //Task Resume
        task.resume()
    }
    
    //MARK: -
    
    //MARK: 통신 URL
    func makeUrlPlace(str:String, nx:String, ny:String) -> String {
        let url = "http://apis.data.go.kr/1360000/VilageFcstInfoService"
        let KeyString = infoDic["APIKey_Place"] as! String
        var urlParam = ""
        
        //금일날짜
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let todate = formatter.string(from: Date())
        
        //동네예보조회
        urlParam = "/getVilageFcst?ServiceKey=\(KeyString)&pageNo=1" +
        "&numOfRows=12&dataType=JSON&base_date=\(todate)&base_time=2000&nx=\(nx)&ny=\(ny)"
        
        //0200 : 아침 최저기온이 나옴 // Rows 12로 해야함..
        //1100 : 낮 최고기온이 나옴  //  Rows 10로 해야함..
        //API 제공 시간(~이후)
        //02:05, 05:05, 08:05, 11:05, 14:05, 17:05, 20:05, 23:05
        //0200, 0500, 0800, 1100, 1400, 1700, 2000, 2300 (1일 8회)
        
        if(str == "초단기실황조회")
        {
            //초단기실황조회
            urlParam = "/getUltraSrtNcst?serviceKey=\(KeyString)&pageNo=1" +
                "&numOfRows=10&dataType=JSON&base_date=\(todate)&base_time=2030&nx=\(nx)&ny=\(ny)"
        }
        else if(str == "초단기예보조회")
        {
            //초단기예보조회
            urlParam = "/getUltraSrtFcst?serviceKey=\(KeyString)&pageNo=1" +
                "&numOfRows=10&dataType=JSON&base_date=\(todate)&base_time=2300&nx=\(nx)&ny=\(ny)"
        }
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
