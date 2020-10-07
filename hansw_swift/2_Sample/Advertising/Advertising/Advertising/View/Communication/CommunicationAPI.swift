//
//  CommunicationAPI.swift
//  Advertising
//
//  Created by SANGWON HAN on 2020/09/26.
//

import UIKit
import WebKit

class CommunicationAPI: NSObject {

    let infoDic = Bundle.main.infoDictionary!
    
    
    
    func httpJson(pageInt:String, completion: @escaping ([AnyHashable : Any]?, Error?) -> Void) {
        
        var KeyString = infoDic["APIKey"] as! String
        
        //url
        let urlPath = "http://openapi.seoul.go.kr:8088/"+KeyString+"/json/culturalEventInfo/1/\(pageInt)"
        let url = NSURL(string: urlPath)
        //session
        let session = URLSession.shared
        
        //Task
        let task = session.dataTask(with: url! as URL, completionHandler: {
            (data, response, error) -> Void in
           
            //            >1 처음
            //            do{
            //                let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
            //                print(jsonResult)
            //                completion(jsonResult as? [String : Any], nil)
            //            }catch{
            //                print("Error")
            //                print(error.localizedDescription)
            //                completion(nil, error)
            //            }
            
            if let nsstr = NSString(data:data!, encoding: String.Encoding.utf8.rawValue){
                let str = String(nsstr)
                
                print(str)
                
                do {
                    let dic = try JSONSerialization.jsonObject(
                        with: str.data(using: String.Encoding.utf8)!,
                        options:JSONSerialization.ReadingOptions.mutableContainers)
                        as! NSDictionary
                    
                    // Print dictionary
                    // print(dic)
                    
                    //통신하여 가져온 정모를...
                    
                    
                    
                    
                    
                    
                    completion(dic as? [AnyHashable : Any], nil)
                } catch {
                    print("error occured")
                }
            }
            

           
        })
        //Task Resume
        task.resume()
    }
    
    
    
    
}
