//: A UIKit based Playground for presenting user interface
  
//import UIKit
//import PlaygroundSupport
//
//class MyViewController : UIViewController {
//    override func loadView() {
//        let view = UIView()
//        view.backgroundColor = .white
//
//        let label = UILabel()
//        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
//        label.text = "Hello World!"
//        label.textColor = .black
//
//        view.addSubview(label)
//        self.view = view
//    }
//}
//// Present the view controller in the Live View window
//PlaygroundPage.current.liveView = MyViewController()


import SwiftUI
import PlaygroundSupport

//struct ContentView: View {
//    var body: some View {
//        Text("Hello World")
//    }
//}
//PlaygroundPage.current.setLiveView(ContentView())

struct MyView:View
{
    var body: some View{
        NavigationView
            {
                List
                    {
                        Text("listCell_1")
                        Text("listCell_2")
                        Text("listCell_3")
                }
                .navigationBarTitle("Menu")
            //!.listStyle(GroupedListStyle())
        }
    }
}

//플레이그라운스 페이지 실행
PlaygroundPage.current.setLiveView(MyView())






