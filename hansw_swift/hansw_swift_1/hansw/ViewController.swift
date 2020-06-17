//
//  ViewController.swift
//  hansw
//
//  Created by SANGWON HAN on 29/02/2020.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
        var pictures = [String]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title =  "Storm Picture"
        //타이틀의 글자에 효과를 준다
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        //items는 String 배열이라고 못받아 둔것 (오류발생 시 Runtime Error가 발생하고 강제종료)
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            
            //prefix는 문자열 앞부분을 조사하고, suffix는 문자열 뒷부분을 조사합니다.
            if item.hasPrefix("nssl"){
                //그림을 읽는다.
                pictures.append(item);
            }
            
        }
        print(pictures);
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pictures.count
    }
    //테이블의 각 셀의 모양을 꾸미는 역할을 한다.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
    }
    
    //didSelectRowAt -> 셀을 눌렀을때 반응하는 tableView 함수이다. 선택된 테이블의 셀의 row를 가져오는데 이때 DeatilViewController를 불러주는 작업을 한다.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController
        {
            //vc는 DetailViewController 객체로 객체의 selectedImage에
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}

