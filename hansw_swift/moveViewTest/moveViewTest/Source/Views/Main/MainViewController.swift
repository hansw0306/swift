//
//  MainViewController.swift
//  moveViewTest
//
//  Created by SANGWON HAN on 2020/05/28.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//


// MARK: 링크
//아래 링크의 이미지를 사용하여 화면을 꾸며주는 작업을 하도록 하지.
//https://www.youtube.com/watch?v=k90V115zqRk
//이부분도 나중에 추가 작업 진행해 보자
//https://eastroot1590.tistory.com/entry/UICollectionView-3-실습-CardNews1?category=848449
//요기 좋다
//https://unclean.tistory.com/60?category=834416



import UIKit

class MainViewController: UIViewController {

    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
       //컬랙션 뷰 생성 + 컬렉션 뷰 셀 설정
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//타이틀 및 설정
        title = "메인"
        navigationController?.navigationBar.isHidden = false
        
        if #available(iOS 13.0, *) {
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(systemName: "person.fill"),
                                                               style: .plain,
                                                               target: self,
                                                               action: #selector(LeftNavigationItemButtonAction))
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Right",
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(RightNavigationItemButtonAction))
            
            
        } else {
            // Fallback on earlier versions
        }

        //collectionView를 add해 준다.
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 140).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    // 사이드 메뉴 띄우기
//    let sidemenuVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SidemenuVC") as! SidemenuViewController
//    self.addChildViewController(sidemenuVC)
//    sidemenuVC.view.frame = self.view.frame
//    self.view.addSubview(sidemenuVC.view)
//    sidemenuVC.didMove(toParentViewController: self)
    
    
    
    // MARK: -
    // MARK: 이벤트
    @objc func RightNavigationItemButtonAction() {
        
        if let controller = storyboard?.instantiateViewController(withIdentifier: "FuncList"){
            print("리스트 화면 이동")
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    @objc func LeftNavigationItemButtonAction() {
        print("메인에서 로그인으로")
        
        NativeFuc().back(mViewCon: self)

    }
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.height/2.5    )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
        
    }
    
    

}
