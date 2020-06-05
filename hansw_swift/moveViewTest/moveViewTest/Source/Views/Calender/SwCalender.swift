//
//  SwCalender.swift
//  moveViewTest
//
//  Created by SANGWON HAN on 2020/06/05.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

import UIKit

class SwCalender: UIViewController {

    @IBOutlet var calenderBar: UINavigationBar!
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
            //
            self.calenderBar.topItem?.title = "달력입니다."
       }
    
    private func initCollection() {  // CollectionView의 초기 설정
          self.swCalenderView.delegate = self
          self.swCalenderView.dataSource = self
          // 어떠한 타입의 셀을 사용하는지 미리 알려줘야 한다. 그렇지 않으면 아래 dequeueReusableCell에서 에러가 발생한다.
          self.swCalenderView.register(UINib(nibName: "calenderCell", bundle: nil), forCellWithReuseIdentifier: "calenderCell")
      }
    

//MARK:-
//MARK: 버튼 Action
    @IBAction func PrevItemAction(_ sender: Any) {
        // 전 달로 이동
    }
    
    
    @IBAction func NextItemAction(_ sender: Any) {
         // 다음 달로 이동
    }
    


}

//MARK:-
//MARK: CollectionView Delegate
extension SwCalender: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2 // 요일 섹션과 일 섹션
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 7 // 월 화 수 목 금 토 일
        default:
            return items.count // 월 별 일 수
        }
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

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       // 간단히 프레임 사이즈에 맞추어 일주일이 표시될 수 있도록 설정
        let myBoundSize: CGFloat = UIScreen.main.bounds.size.width
        let cellSize : CGFloat = myBoundSize / 9
        return CGSize(width: cellSize, height: cellSize)
    }
}
