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
    
    
    func Obj_Func()  {
        objLib.nsLogPrint()
    }
    func Obj_UnzipResource() -> Bool {
        return objLib.unzipResource()
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
