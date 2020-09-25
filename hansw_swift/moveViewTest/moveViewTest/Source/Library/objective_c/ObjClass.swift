//
//  ObjClass.swift
//  moveViewTest
//
//  Created by SANGWON HAN on 2020/07/10.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

import UIKit

class ObjClass: NSObject {
    let objLib = MobileLibrary()
    
    //Obj기능들을 사용하기위한 종합함수
    func Obj_Func(dic:NSDictionary)  {
        objLib.onMoibleLib(dic as? [AnyHashable : Any])
    }
    //Resource.zip을 풀기위한 로직
    func Obj_UnzipResource() -> Bool {
        return objLib.unzipResource()
    }
    //Log정보를 넣을 수 있는 로직
    func Obj_LogSetting() {
        objLib.mylogSetting(Int32(LOG_DEBUG_VIEW.rawValue))
    }
    func Obj_Log(msg:String)
    {
        objLib.mylog(msg)
    }
}

//MARK: objetive_c class

//0. Objetive c 클래스를 확장하는 방법
//@objc class MobileLibrary:NSObject
//{
//    func MobilePrint() {
//
//        print("hansw Test")
//
//    }
//
//}
