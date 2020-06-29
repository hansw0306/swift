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

struct CustomData {
    var title : String
    var image : UIImage
    var url : String
}

class MainViewController: UIViewController {
    
    //화면 사이즈
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
       //컬랙션 뷰 생성 + 컬렉션 뷰 셀 설정
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        //cell클레스를 넣어준다
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        //cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//타이틀 및 설정
        title = "메인"
        navigationController?.navigationBar.isHidden = false
        
        if #available(iOS 13.0, *) {
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(systemName: "rectangle.3.offgrid.fill"),
                                                               style: .plain,
                                                               target: self,
                                                               action: #selector(LeftNavigationItemButtonAction))
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "func List",
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(RightNavigationItemButtonAction))
            
            
        } else {
            // Fallback on earlier versions
        }

        //collectionView를 add해 준다.
        view.addSubview(collectionView)
        collectionView.backgroundColor = UIColor(red: 67.0/255, green: 122.0/255, blue: 255.0/255, alpha: 1.0)
        //top 340간격
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 740).isActive = true
        //left 40간격
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        //right 40간격
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        
        // 높이조절
        //collectionView.heightAnchor.constraint(equalToConstant: view.frame.height/2).isActive = true
        //bottom간격
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        //collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 1.8).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = false
        } else {
            // Fallback on earlier versions
        }
    }
    
    // MARK: -
    // MARK: 이벤트
    
    
    @IBAction func MainButtonAction(_ sender: Any) {
        print("메인에서 로그인으로")
        NativeFuc().back(mViewCon: self)
    }
    
    @objc func RightNavigationItemButtonAction() {
        
        if let controller = storyboard?.instantiateViewController(withIdentifier: "FuncList"){
            print("리스트 화면 이동")
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    @objc func LeftNavigationItemButtonAction() {
            NativeFuc().leftShowView(storyboard: (navigationController?.storyboard!)!, presentVC: self)
        
        
            // 사이드 메뉴 띄우기
//            let sidemenuVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SidemenuVC") as! SidemenuViewController
//            self.addChild(sidemenuVC)
//            sidemenuVC.view.frame = self.view.frame
//            self.view.addSubview(sidemenuVC.view)
//            sidemenuVC.didMove(toParent: self)
        
    }
    
}
// MARK: -
// MARK: extension
extension MainViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{

    
    
    //셀 크기 조절
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         CGSize(width: collectionView.frame.width/8, height: collectionView.frame.height/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7 //data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell

        //cell.data = self.data[indexPath.row]
        cell.backgroundColor = .white
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        //양 옆사이 간격 조절
           return 10.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }

}
// MARK: -
// MARK: Custom class

//컬렉션 뷰에 들어갈 Cell을 커스텀 하자.
class CustomCell: UICollectionViewCell {
    
    
    var data: CustomData?{
        didSet{
            guard let data = data else{return}
            bg.image = data.image
        }
    }
    
    fileprivate let bg: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemonted")
    }
}
