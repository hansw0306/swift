//
//  MainTableView.swift
//  Advertising
//
//  Created by SANGWON HAN on 2020/09/26.
//

import UIKit

class MainTableView: UITableView {
    
//    var categoryArry = ["C","C","C","C"]
//    var bigTitleArry = ["big1","big2","big3","big4"]
//    var smallTitleArry = ["small1","small2","small3","small4"]
    
    var jsonDic : Dictionary<AnyHashable, Any>?
    func setJsonData(jsonData:[AnyHashable : Any]?) {
        //최상위Json
        
        //1. 문화이벤트 정보
        let culturalEventInfo = jsonData?["culturalEventInfo"] as! NSDictionary
        //1-1 총 데이터 건수 (정상조회 시 출력됨)
        var list_total_count = culturalEventInfo.object(forKey: "list_total_count") as! Int
        
        //1-2 가져온 결과의 코드와 메시지(성공,실패여부)
        var result = culturalEventInfo.object(forKey: "RESULT") as! NSDictionary
        //요청결과 코드 (하단 메세지설명 참고)
        var code = result.object(forKey: "CODE") as! NSString
        //요청결과 메시지 (하단 메세지설명 참고)
        var message = result.object(forKey: "MESSAGE") as! NSString
        
        /*
         INFO-000    정상 처리되었습니다
         ERROR-300    필수 값이 누락되어 있습니다.
         요청인자를 참고 하십시오.
         INFO-100    인증키가 유효하지 않습니다.
         인증키가 없는 경우, 열린 데이터 광장 홈페이지에서 인증키를 신청하십시오.
         ERROR-301    파일타입 값이 누락 혹은 유효하지 않습니다.
         요청인자 중 TYPE을 확인하십시오.
         ERROR-310    해당하는 서비스를 찾을 수 없습니다.
         요청인자 중 SERVICE를 확인하십시오.
         ERROR-331    요청시작위치 값을 확인하십시오.
         요청인자 중 START_INDEX를 확인하십시오.
         ERROR-332    요청종료위치 값을 확인하십시오.
         요청인자 중 END_INDEX를 확인하십시오.
         ERROR-333    요청위치 값의 타입이 유효하지 않습니다.
         요청위치 값은 정수를 입력하세요.
         ERROR-334    요청종료위치 보다 요청시작위치가 더 큽니다.
         요청시작조회건수는 정수를 입력하세요.
         ERROR-335    샘플데이터(샘플키:sample) 는 한번에 최대 5건을 넘을 수 없습니다.
         요청시작위치와 요청종료위치 값은 1 ~ 5 사이만 가능합니다.
         ERROR-336    데이터요청은 한번에 최대 1000건을 넘을 수 없습니다.
         요청종료위치에서 요청시작위치를 뺀 값이 1000을 넘지 않도록 수정하세요.
         ERROR-500    서버 오류입니다.
         지속적으로 발생시 열린 데이터 광장으로 문의(Q&A) 바랍니다.
         ERROR-600    데이터베이스 연결 오류입니다.
         지속적으로 발생시 열린 데이터 광장으로 문의(Q&A) 바랍니다.
         ERROR-601    SQL 문장 오류 입니다.
         지속적으로 발생시 열린 데이터 광장으로 문의(Q&A) 바랍니다.
         INFO-200    해당하는 데이터가 없습니다.
         */
        
        
        //1-3 가져온 정보
        var row = culturalEventInfo.object(forKey: "row") as! NSDictionary
        
        var codename = row.object(forKey: "CODENAME") as! NSString
        var title = row.object(forKey: "TITLE") as! NSString
        var date = row.object(forKey: "DATE") as! NSString
        var place = row.object(forKey: "PLACE") as! NSString
        var org_name = row.object(forKey: "ORG_NAME") as! NSString
        var use_trgt = row.object(forKey: "USE_TRGT") as! NSString
        var use_fee = row.object(forKey: "USE_FEE") as! NSString
        var player = row.object(forKey: "PLAYER") as! NSString
        var program = row.object(forKey: "PROGRAM") as! NSString
        var etc_desc = row.object(forKey: "ETC_DESC") as! NSString
        var org_link = row.object(forKey: "ORG_LINK") as! NSString
        var main_img = row.object(forKey: "MAIN_IMG") as! NSString
        var rgstdate = row.object(forKey: "RGSTDATE") as! NSString
        var ticket = row.object(forKey: "TICKET") as! NSString
        var strtdate = row.object(forKey: "STRTDATE") as! NSString
        var end_date = row.object(forKey: "END_DATE") as! NSString
        var themecode = row.object(forKey: "THEMECODE") as! NSString
        

    }
    
    //값을 저장하고
    func setMainCulturalEventData(eventDic:NSDictionary) {
        
        let defaults = UserDefaults.standard
        defaults.setValue(eventDic, forUndefinedKey: "culturalEventInfo")
        
    }
    
    func getMainCulturalEventData(eventDic:NSDictionary) -> NSDictionary? {
        
        let defaults = UserDefaults.standard
        if let stringOne = defaults.dictionary(forKey: "culturalEventInfo") {
            print(stringOne) // Some String Value
            return stringOne as NSDictionary
        }
        
        return nil
    }
    
}

//MARK: - UITableViewDataSource
extension MainTableView:UITableViewDataSource
{
    // table row 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    //tabl cell 작업
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell

        
        
        
//        cell.cellCategory.text = categoryArry[indexPath.row]
//        cell.cellBigTitle.text = bigTitleArry[indexPath.row]
//        cell.cellSmallTitle.text = smallTitleArry[indexPath.row]
        
//        let unknownImage: UIImage = UIImage(named: "Unknown")!
//        cell.celImage =  UIImageView(image: unknownImage)
        
        return cell
    }
    
    override func numberOfRows(inSection section: Int) -> Int {
        return 5
    }
    
}

extension MainTableView:UITableViewDelegate
{
    
}


