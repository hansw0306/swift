//
//  FuncList.swift
//  moveViewTest
//
//  Created by SANGWON HAN on 2020/06/08.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

import UIKit

/*
 뷰 컨트롤러에서 테이블 뷰를 사용할때
 1. UITableViewDelegate 및 UITableViewDataSource 프로토콜을 채택합니다.
 2. numberOfRowsInSection 메소드는 테이블 뷰에있을 행 수를 결정합니다.
 3. cellForRowAtIndexPath 메소드는 각 행을 설정합니다.
 5. didSelectRowAtIndexPath 메서드는 행을 두 드릴 때마다 호출됩니다.
 */


class FuncList: UITableViewController {

    let functionList = ["사진","앨범","설정","공유","생체인식"]
    let customViewList = ["그림판","웹","알림"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "함수 호출"
        
        
    }

    // MARK: - Table view data source
    //섹션을 몇개로 할지 설정한다.
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    //세션에 맞게 Cell의 count를 넣어준다.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if section == 0{
            return functionList.count
        }
        else{
            return customViewList.count
        }
    }
    
    //Cell의 헤더를 붙여주는 함수
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Func"
        case 1:
            return "CustomView"
        default:
            return ""
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
            
            if indexPath.section == 0{
                //tableView.section
                cell.textLabel?.text = functionList[indexPath.row]
            }
            else if indexPath.section == 1{
                cell.textLabel?.text = customViewList[indexPath.row]
            }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        //0부터 시작한다.
        //print("You tapped cell number \(indexPath.row).")
    if let cellName :String = tableView.cellForRow(at: indexPath)?.textLabel?.text
        {
            switch cellName {
            case "사진":
                print("")
            case "앨범":
                print("")
            case "설정":
                print("")
            case "공유":
                print("")
            case "생체인식":
                print("")
            case "그림판":
                print("")
            case "웹":
                print("")
            default:
                print("defaul")
            }
           
        }
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
