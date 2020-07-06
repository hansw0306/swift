//
//  CallBack.swift
//  moveViewTest
//
//  Created by SANGWON HAN on 2020/07/06.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

import UIKit

//Delegate
protocol CallBackDelegate {
    //func CallDelegataFunc()
}


class CallBack: NSObject {
    //delegate 객체
    var delegate: CallBackDelegate?
    
    init(delegate:CallBackDelegate?) {
        //self.delegate = delegate;
        
        super.init()
        // Designed initialiser
    }
    convenience override init() {
        self.init(delegate:nil)
    }
    
    
    func CallDelegataFunc(){
        
        print("Call NativeFunc Delegate")
    }
}
