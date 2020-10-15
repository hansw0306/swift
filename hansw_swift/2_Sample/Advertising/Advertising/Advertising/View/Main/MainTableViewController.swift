//
//  MainTableViewController.swift
//  Advertising
//
//  Created by SANGWON HAN on 2020/10/15.
//

import UIKit

class MainTableViewController: UIViewController {
    
    @IBOutlet var mainTableView: MainTableView!
    var mCommunicationAPI: CommunicationAPI!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//MARK: 데이터 작업
        mCommunicationAPI = CommunicationAPI.init()
        mCommunicationAPI.httpJson(pageInt:"5") { (result, error) in
            if let result = result {
                print("success: \(result)")
                
//                DispatchQueue.main.async {
//
//                }
                self.mainTableView.setJsonData(jsonData: result)
                DispatchQueue.main.async {
                    self.mainTableView.dataSource = self.mainTableView
                    self.mainTableView.delegate = self.mainTableView
                    //스토리보드에 같이 있을때
                    //mainTableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
                    
                    let viewCellNibName = UINib(nibName: "MainTableViewCell", bundle: nil)
                    self.mainTableView.register(viewCellNibName, forCellReuseIdentifier: "MainTableViewCell")
                    
                    //$$ TEST---> 인디게이터를 만들고 아래의 reloadData를 했을때 지우는 작업을 넣어주도록 한다.
                    self.mainTableView.reloadData()
                }
            } else if let error = error {
                print("error: \(error.localizedDescription)")
            }
        }
        
    }


}
