//
//  CreatAccountViewController.swift
//  moveViewTest
//
//  Created by SANGWON HAN on 2020/06/11.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

import UIKit

class CreatAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        //화면이 눌렸을때 키보드를 내려주도록 한다.
          self.view.endEditing(true)
    }
    
}
