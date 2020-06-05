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
    
//    let items = ["1","2","3","4","5","6","7","8","9","10",
//                "11","12","13","14","15","16","17","18","19","20",
//                "21","22","23","24","25","26","27","28","29","30"]
    
       let now = Date()
       var cal = Calendar.current
       let dateFormatter = DateFormatter()
       var components = DateComponents()
       var weeks: [String] = ["日", "月", "火", "水", "木", "金", "土"]
       var days: [String] = []
       var daysCountInMonth = 0 // 해당 월이 며칠까지 있는지
       var weekdayAdding = 0 // 시작일
    //---------------------------------- 변수 설정 -------------------------------------//
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.initView()
    }
    
    private func initView() {
        // 뷰을 초기 설정
        self.initCollection()
        
        dateFormatter.dateFormat = "yyyy年M月" // 월 표시 포맷 설정
        components.year = cal.component(.year, from: now)
        components.month = cal.component(.month, from: now)
        components.day = 1
        self.calculation()
        
    }
    
    private func initCollection() {  // CollectionView의 초기 설정
          self.swCalenderView.delegate = self
          self.swCalenderView.dataSource = self
          // 어떠한 타입의 셀을 사용하는지 미리 알려줘야 한다. 그렇지 않으면 아래 dequeueReusableCell에서 에러가 발생한다.
          self.swCalenderView.register(UINib(nibName: "calenderCell", bundle: nil), forCellWithReuseIdentifier: "calenderCell")
      }

    //------------------------------- 초기 설정 추가 -----------------------------------//
     
    private func calculation() { // 월 별 일 수 계산
        let firstDayOfMonth = cal.date(from: components)
        let firstWeekday = cal.component(.weekday, from: firstDayOfMonth!) // 해당 수로 반환이 됩니다. 1은 일요일 ~ 7은 토요일
        daysCountInMonth = cal.range(of: .day, in: .month, for: firstDayOfMonth!)!.count
        weekdayAdding = 2 - firstWeekday // 이 과정을 해주는 이유는 예를 들어 2020년 4월이라 하면 4월 1일은 수요일 즉, 수요일이 달의 첫날이 됩니다.  수요일은 component의 4 이므로 CollectionView에서 앞의 3일은 비울 필요가 있으므로 인덱스가 1일부터 시작할 수 있도록 해줍니다. 그래서 2 - 4 해서 -2부터 시작하게 되어  정확히 3일 후부터 1일이 시작하게 됩니다.
        
        //    1  일요일 2 - 1  -> 0번 인덱스부터 1일 시작
        //    2 월요일 2 - 2  -> 1번 인덱스부터 1일 시작
        //    3 화요일 2 - 3  -> 2번 인덱스부터 1일 시작
        //    4 수요일 2 - 4  -> 3번 인덱스부터 1일 시작
        //    5 목요일 2 - 5  -> 4번 인덱스부터 1일 시작
        //    6 금요일 2 - 6  -> 5번 인덱스부터 1일 시작
        //    7 토요일 2 - 7  -> 6번 인덱스부터 1일 시작
        
        //타이틀
        self.calenderBar.topItem?.title = dateFormatter.string(from: firstDayOfMonth!)
        self.days.removeAll()
        for day in weekdayAdding...daysCountInMonth {
            if day < 1 { // 1보다 작을 경우는 비워줘야 하기 때문에 빈 값을 넣어준다.
                self.days.append("")
            } else {
                self.days.append(String(day))
            }
        }
    }

//MARK:-
//MARK: 버튼 Action
    @IBAction func PrevItemAction(_ sender: Any) {
        // 전 달로 이동
        components.month = components.month! - 1
        self.calculation()
        self.swCalenderView.reloadData()
    }
    
    
    @IBAction func NextItemAction(_ sender: Any) {
         // 다음 달로 이동
        components.month = components.month! + 1
        self.calculation()
        self.swCalenderView.reloadData()
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
            return self.days.count // 일의 수
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = swCalenderView.dequeueReusableCell(withReuseIdentifier: "calenderCell", for: indexPath) as! calenderCell
        
        //cell.cellLable.text = items[indexPath.item]
        
        switch indexPath.section {
        case 0:
            cell.cellLable.text = weeks[indexPath.row] // 요일
        default:
            cell.cellLable.text = days[indexPath.row] // 일
        }
        
        if indexPath.row % 7 == 0 { // 일요일
            cell.cellLable.textColor = .red
        } else if indexPath.row % 7 == 6 { // 토요일
            cell.cellLable.textColor = .blue
        } else { // 월요일 좋아(평일)
            cell.cellLable.textColor = .black
        }
        
        
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
