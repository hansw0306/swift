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
//https://pilgwon.github.io/blog/2017/08/30/Dealing-with-Complex-Table-Views-in-iOS.html

class FuncList: UITableViewController {

    var nativeFunctionList = ["카메라","앨범","설정","공유","생체인식"]
    var customViewList = ["그림판","웹","알림"]
    var functionList = ["데이터 베이스","info","암호화","틸옥체크","local 디렉토리 생성"]
    
    let mNativeFunc = NativeFuc.init()
    let mWebViewCon = WebView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "함수 호출"
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
        
    }

// MARK: - Table view data source
    // MARK: 1. Section
    //섹션을 몇개로 할지 설정한다.
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    //Cell의 헤더를 붙여주는 함수
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "NativeFunc"
        case 1:
            return "CustomView"
        case 2:
                return "Func"
        default:
            return ""
        }
    }
    
    // MARK: 2. Cell
    //세션에 맞게 Cell의 count를 넣어준다.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if section == 0{
            return nativeFunctionList.count
        }
            
        else if section == 1{
            return customViewList.count
        }
        else{
            return functionList.count
        }
    }
    
    // Cell in Data
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
            
            if indexPath.section == 0{
                //tableView.section
                cell.textLabel?.text = nativeFunctionList[indexPath.row]
            }
            else if indexPath.section == 1{
                cell.textLabel?.text = customViewList[indexPath.row]
            }
            else if indexPath.section == 2{
                cell.textLabel?.text = functionList[indexPath.row]
        }
        
        return cell
    }
    
    //Cell 버튼 클릭
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        //0부터 시작한다.
        //print("You tapped cell number \(indexPath.row).")
    if let cellName :String = tableView.cellForRow(at: indexPath)?.textLabel?.text
        {
            switch cellName {
            case "카메라":
                do {
                    mNativeFunc.OpenCamera()
                    print("OpenCamera")
                    
                }
            case "앨범":
                do{
                    mNativeFunc.OpenAlbum()
                    print("OpenAlbum")
                }
            case "설정":
                do{
                    mNativeFunc.OpenSetting()
                    print("OpenSetting")
                }
            case "공유":
                print("")
            case "생체인식":
                do{
                    mNativeFunc.OpenBioAuth { (result:String) in
                        print("지문인식 결과 :  \(result)");
                    }
                }
//---------------------------------------------------------------------------------------------------------
            case "그림판":
                print("")
            case "웹":
                do{
                    //NativeFuc().ExXibViewMove(viewCont: mWebViewCon, modalPresentationStyle: 5)
                    present(mWebViewCon, animated: true, completion: nil)
                }
//---------------------------------------------------------------------------------------------------------

//            var functionList = ["데이터 베이스","info","암호화","틸옥체크","local 디렉토리 생성"]
                
                
            case"데이터 베이스":
                print("데이터 베이스")
            case"info":
                print("info")
            case"암호화":
                print("암호화")
            case"틸옥체크":
                do{
                    print(" 탈옥체크 : \(mNativeFunc.getJailbrokenStatus())")
                }
            case"local 디렉토리 생성":
                do{
                    print(" local 디렉토리 생성 : \(mNativeFunc.CreateDirectory(drectoryName: "image"))")
                }
                
            default:
                print("defaul")
            }
           
        }
        
    }
    
    // MARK: 3. TableList remove style
    //리스트 삭제 스타일 추가
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        //https://stackoverflow.com/questions/3309484/uitableviewcell-show-delete-button-on-swipe/37719543#37719543
        if editingStyle == .delete {
            // remove the item from the data model
            
            if indexPath.section == 0{
            nativeFunctionList.remove(at: indexPath.row)
            }
            else if indexPath.section == 1{
                customViewList.remove(at: indexPath.row)
            }
            else if indexPath.section == 2{
                functionList.remove(at: indexPath.row)
            }

            // delete the table view row
            tableView.deleteRows(at: [indexPath], with: .fade)

        } else if editingStyle == .insert {
            // Not used in our example, but if you were adding a new row, this is where you would do it.
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
