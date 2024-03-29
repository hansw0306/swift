//
//  SearchPlaceTableViewController.swift
//  search_extension
//
//  Created by 한상원 on 14/06/2021.
//  Copyright © 2021 한상원. All rights reserved.
//


import UIKit

protocol SearchTableDelegate {
    func Place(placeStr:String, nx:String, ny:String)
}

class SearchPlaceTableViewController: UITableViewController, UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate, SearchTableDelegate{
   
    //create the search controller and result contoller
    var dataArray = [Data]()
    var fileteredData = [Data]()
    
    //데이터베이스
    var mDBManager : DBManager?
    
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
        self.mDBManager = DBManager.init()
        let mKorPlace = self.mDBManager!.getAllPlace()

        for place in mKorPlace {
            if place.name != ""{
                dataArray.append(Data(main: place.name, px: place.px, py: place.py))
            }
        }
    }
// MARK: - delegate Func
    func Place(placeStr: String, nx: String, ny: String) {
    }
}

extension SearchPlaceTableViewController {
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
                 
                //"SELECT * FROM KOR_PLACE"
                let Str = "SELECT * FROM KOR_PLACE WHERE name='" + (cell.textLabel?.text)! + "'"
                let selectResult = self.mDBManager?.getSelectQuery(selectStr: Str)
                
                selectResult?.first?.px
                
                
                self.delegate?.Place(placeStr:selectResult?.first?.name ?? "",
                                           nx:selectResult?.first?.px ?? "",
                                           ny:selectResult?.first?.py ?? "")
            }
                }
        let noAction = UIAlertAction(title: "취소", style: .default) { (action) in
            self.searchController.searchBar.text = cell.textLabel?.text
                }
        alert.addAction(okAction)
        alert.addAction(noAction)
        
        //searchController에 검색하고 있는중 선택하여 위치를 찾아오려고 할때 얼랏이 안나오는 현상이 있어 수정하였다.
        if searchController.isActive {
            self.searchController.dismiss(animated: false) {
                // Do what you want here like perform segue or present
                self.present(alert, animated: true, completion: nil)
            }
        }
        else{
            present(alert, animated: true, completion: nil)
        }
        
        
    }
}
