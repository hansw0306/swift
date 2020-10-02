//
//  MainTableView.swift
//  Advertising
//
//  Created by SANGWON HAN on 2020/09/26.
//

import UIKit

class MainTableView: UITableView {
    
    var categoryArry = ["C","C","C","C"]
    var bigTitleArry = ["big1","big2","big3","big4"]
    var smallTitleArry = ["small1","small2","small3","small4"]
    //var imageArry = [unknownImage,unknownImage,unknownImage,unknownImage]//일단 값 안넣는다.
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
}

//MARK: - UITableViewDataSource
extension MainTableView:UITableViewDataSource
{
    // table row 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bigTitleArry.count
    }
    
    //tabl cell 작업
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
    
        cell.cellCategory.text = categoryArry[indexPath.row]
        cell.cellBigTitle.text = bigTitleArry[indexPath.row]
        cell.cellSmallTitle.text = smallTitleArry[indexPath.row]
        
//        let unknownImage: UIImage = UIImage(named: "Unknown")!
//        cell.celImage =  UIImageView(image: unknownImage)
        
        return cell
    }
    
    override func numberOfRows(inSection section: Int) -> Int {
        return bigTitleArry.count
    }
    
}

extension MainTableView:UITableViewDelegate
{
    
}


