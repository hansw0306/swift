//
//  MainTableView.swift
//  Advertising
//
//  Created by SANGWON HAN on 2020/09/26.
//

import UIKit

class MainTableView: UITableView {
    //var jsonDic : Dictionary<AnyHashable, Any>?
    var mainViewDataArry = NSArray()
    let unknownImage: UIImage = UIImage(named: "Unknown")!
    
//MARK:- FUNC
    
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
        
        
        //1-3 가져온 정보 저장
        self.mainViewDataArry = culturalEventInfo.object(forKey: "row") as! NSArray

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
        return mainViewDataArry.count
    }
    
    //tabl cell 작업
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell

        //저장한 데이터를 리스트에 뿌려주는 작업을 해야한다.
        let mainViewData =  mainViewDataArry[indexPath.row] as! NSDictionary
        
//        let codename = mainViewData.object(forKey: "CODENAME") as! NSString
        let title = mainViewData.object(forKey: "TITLE") as! NSString
//        let date = mainViewData.object(forKey: "DATE") as! NSString
//        let place = mainViewData.object(forKey: "PLACE") as! NSString
        let org_name = mainViewData.object(forKey: "ORG_NAME") as! NSString
//        let use_trgt = mainViewData.object(forKey: "USE_TRGT") as! NSString
//        let use_fee = mainViewData.object(forKey: "USE_FEE") as! NSString
//        let player = mainViewData.object(forKey: "PLAYER") as! NSString
//        let program = mainViewData.object(forKey: "PROGRAM") as! NSString
//        let etc_desc = mainViewData.object(forKey: "ETC_DESC") as! NSString
//        let org_link = mainViewData.object(forKey: "ORG_LINK") as! NSString
        var main_img = mainViewData.object(forKey: "MAIN_IMG") as! NSString
//        let rgstdate = mainViewData.object(forKey: "RGSTDATE") as! NSString
//        let ticket = mainViewData.object(forKey: "TICKET") as! NSString
//        let strtdate = mainViewData.object(forKey: "STRTDATE") as! NSString
//        let end_date = mainViewData.object(forKey: "END_DATE") as! NSString
//        let themecode = mainViewData.object(forKey: "THEMECODE") as! NSString
        

        let image_url_array = main_img.components(separatedBy: "http://culture.seoul.go.kr")
        
        var imageURL = "http://culture.seoul.go.kr" + image_url_array.last! as String
        
        //문자열 찾기
        if imageURL.contains("http://culture.seoul.go.krhttp://www") {
            //문자열 자르기
            imageURL = (imageURL.replacingOccurrences(of: "http://culture.seoul.go.krhttp", with:"http") as NSString) as String
        }
        
        cell.cellCategory.text = "C"
        cell.cellBigTitle.text = title as String
        cell.cellSmallTitle.text = org_name as String
        
        //NSData(contentsOf: url as URL) 으로 변환하면 리스트를 다시 그릴때 버벅거린다.
        //1. 비동기로 하면 버벅거리는 현상은 없지만 이미지가 다시 들어가는게 너무 느리다.
        if let url = NSURL(string: imageURL as String) {
            DispatchQueue.global(qos: .default).async{
                if let data = NSData(contentsOf: url as URL) {
                    DispatchQueue.main.async {
                        if((UIImage(data: data as Data)) != nil){
                            
                            if(UIImage(data: data as Data) != nil){
                                cell.celImage.image = UIImage(data: data as Data)
                            }
                            else{
                                cell.celImage.image =  self.unknownImage
                            }
                            
                        }
                    }
                }
            }
        }
        
        
        return cell
    }
    
    override func numberOfRows(inSection section: Int) -> Int {
        return mainViewDataArry.count
    }
    
}

extension MainTableView:UITableViewDelegate
{
    
}


