//
//  ViewController.swift
//  Advertising
//
//  Created by SANGWON HAN on 2020/09/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainTableView: MainTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainTableView.dataSource = mainTableView
        mainTableView.delegate = mainTableView
        //스토리보드에 같이 있을때
        //mainTableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
        
        let viewCellNibName = UINib(nibName: "MainTableViewCell", bundle: nil)
        mainTableView.register(viewCellNibName, forCellReuseIdentifier: "MainTableViewCell")
        
    }


}

