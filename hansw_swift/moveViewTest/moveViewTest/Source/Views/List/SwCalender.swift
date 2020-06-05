//
//  SwCalender.swift
//  moveViewTest
//
//  Created by SANGWON HAN on 2020/06/05.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

import UIKit

class SwCalender: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var swCalenderView: UICollectionView!
    
    let items = ["1","2","3","4","5","6","7","8","9","10",
                "11","12","13","14","15","16","17","18","19","20",
                "21","22","23","24","25","26","27","28","29","30"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.initView()
    }

    
    private func initView() {  // 뷰을 초기 설정
           self.initCollection()
       }
    
    private func initCollection() {  // CollectionView의 초기 설정
          self.swCalenderView.delegate = self
          self.swCalenderView.dataSource = self
          self.swCalenderView.register(UINib(nibName: "calenderCell", bundle: nil), forCellWithReuseIdentifier: "calenderCell")
      }
    

   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = swCalenderView.dequeueReusableCell(withReuseIdentifier: "calenderCell", for: indexPath) as! calenderCell
        
        cell.cellLable.text = items[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        //컬렉션 뷰의 Cell 이 눌렸을때 불리는 값잉다
        
        print(indexPath.item)
    }

}
