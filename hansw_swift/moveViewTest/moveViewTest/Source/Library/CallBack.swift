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
    func CallBackDelegateFunc()
}

class CallBack: NSObject {
    //delegate 객체
    var delegate: CallBackDelegate?
    
    init(delegate:CallBackDelegate?) {
        //self.delegate = delegate;
        
        super.init()
        // Designed initialiser
    }
    //이렇게 사용해야 객체를 선언할때 init()과 init(delegate:CallBackDelegate?)를 둘다 사용할 수 있다.
    override convenience init() {
        self.init(delegate:nil)
    }
    
    
    func CallBackDelegateFunc(){
        
        print("Call NativeFunc Delegate")
    }
}
