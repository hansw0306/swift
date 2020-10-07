//
//  ViewController.swift
//  Advertising
//
//  Created by SANGWON HAN on 2020/09/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainTableView: MainTableView!
    var mCommunicationAPI: CommunicationAPI!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mCommunicationAPI = CommunicationAPI.init()
        
        mCommunicationAPI.httpJson(pageInt:"5") { (result, error) in
            if let result = result {
                print("success: \(result)")
                
                DispatchQueue.main.async {
                    
                    self.mainTableView.setJsonData(jsonData: result)
                    
                    self.mainTableView.dataSource = self.mainTableView
                    self.mainTableView.delegate = self.mainTableView
                    //스토리보드에 같이 있을때
                    //mainTableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
                    
                    let viewCellNibName = UINib(nibName: "MainTableViewCell", bundle: nil)
                    self.mainTableView.register(viewCellNibName, forCellReuseIdentifier: "MainTableViewCell")
                }
            } else if let error = error {
                print("error: \(error.localizedDescription)")
            }
        }
        
        
        
        
        
    }


}

