//
//  TableViewController.swift
//  search_extension
//
//  Created by 송동욱 on 26/09/2018.
//  Copyright © 2018 송동욱. All rights reserved.
//

import UIKit

protocol SearchTableDelegate {
    func Place(placeStr:String) -> String?
}

class TableViewController: UITableViewController, UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate, SearchTableDelegate{
   
    //create the search controller and result contoller
    var dataArray = [Data]()
    var fileteredData = [Data]()
    
    var searchController = UISearchController()
    var resultVC = UITableViewController()
    var delegate : SearchTableDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        searchController = UISearchController(searchResultsController: resultVC)
        
        tableView.tableHeaderView = searchController.searchBar
        //usally good to set the presentation context  
        self.definesPresentationContext = true
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.delegate = self
        
        resultVC.tableView.delegate = self
        resultVC.tableView.dataSource = self
    }
    
// MARK: 데이터 값 입력
    private func setData(){
        let mDBManager = DBManager.init()
        let mKorPlace = mDBManager.getAllPlace()
        
        for place in mKorPlace {
            if place.name != ""{
            dataArray.append(Data(main: place.name, detail: .A))
            }
        }
    }
// MARK: - delegate Func
    func Place(placeStr: String) -> String? {
        return placeStr
    }
}

extension TableViewController {
    // MARK: - 검색이 눌렸을때
    func updateSearchResults(for searchController: UISearchController) {
        fileteredData = dataArray.filter({ (data:Data) -> Bool in
            return data.main.lowercased().contains(searchController.searchBar.text!.lowercased())
        })
        resultVC.tableView.reloadData()
    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == resultVC.tableView ? fileteredData.count : dataArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = (tableView == resultVC.tableView ? fileteredData[indexPath.row].main : dataArray[indexPath.row].main)
        return cell
    }
    
    // MARK: - 셀이 눌렸을때
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        
        let messageStr = (cell.textLabel?.text)! + "으로\n 위치를 변경하시겠습니까?"
        let alert = UIAlertController(title: "알림",
                                      message: messageStr,
                                      preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            self.dismiss(animated: true) {
                self.delegate?.Place(placeStr: cell.textLabel?.text ?? "")
            }
                }
        let noAction = UIAlertAction(title: "취소", style: .default) { (action) in
            self.searchController.searchBar.text = cell.textLabel?.text
                }
        alert.addAction(okAction)
        alert.addAction(noAction)
        present(alert, animated: false, completion: nil)
        
    }
}
