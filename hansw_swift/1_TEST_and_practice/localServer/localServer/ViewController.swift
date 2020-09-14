//
//  ViewController.swift
//  localServer
//
//  Created by SANGWON HAN on 2020/09/13.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

import UIKit
import WebKit

//네트워크 체크로직에 필요
import Foundation
import SystemConfiguration

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler {
    
    //WkwebView
    weak var webView: WKWebView!
    weak var outputttext: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initWebview_then_callFromJs()
        //웹 주소를 읽는 작업
        loadUrl(urlString: "")
        //화면을 구성
        WebViews_AutoLayout()
    }

    
    //MARK:-  function
        
    
//MARK: webView 객체 생성
    func initWebview_then_callFromJs() {
        //Javascript Call Fucntion Controller
        let contentController = WKUserContentController()
        let config = WKWebViewConfiguration()
        
        contentController.add(self, name: "hello")
        contentController.add(self, name: "test")
        
        config.userContentController = contentController
        webView = WKWebView(frame: self.view.frame, configuration: config)
    }
    
    
//MARK: webView Load작업
        func loadUrl(urlString:String) {
            view.addSubview(webView)
            
            //MARK:-
            let fileManager = FileManager()
            let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
            do {
                // web디렉토리 URL을 가져오고
                let webURL = documentURL?.appendingPathComponent("")
                // 디렉토리 내의 파일 목록을 출력해본다.
                print("web directory Files : \(try FileManager.default.contentsOfDirectory(atPath : webURL!.path))")
                
                let htmlFileURL = webURL?.appendingPathComponent("index.html")
                
                // webView에서 로드해준다.
                // 이 부분에서 allowingReadAccessTo 파라미터에는 index.html의 부모 디렉토리 이상 레벨의 URL을 지정해준다.
                // 여기서는 최상위 레벨인 Document의 URL을 추가했다. webURL을 추가해도 무방하다.
                
                
                webView.loadFileURL(htmlFileURL!, allowingReadAccessTo: documentURL!)
            }
            catch {
                // 알 수 없는 오류
                print("error")
            }
            
            webView.uiDelegate = self
            webView.navigationDelegate = self
            //WKWebview 뒤로가기, 앞으로가기 제스처 사용 ON
            webView.allowsBackForwardNavigationGestures = true
        }
    
    //MARK: 오토레이 아웃 화면 작업
    func WebViews_AutoLayout() {
        /*
               시각적 형식 문법
               다음은 애플에서 제공하는 제약조건의 시각적 형식 예제
               
               시각적 형식                         문법                                      설명
               Standard Space                 [button]-[textField]                        button과 textField의 사이는 표준 간격 차이, 표준 간격은 8.
               Fixed Space                    H:|-50-[purpleBox]-50-|                     purpleBox이 superview를 기준으로 왼쪽 50, 오른쪽 50 간격.(Leading, Trailing)
               Fixed Space                    V:|-75-[label]|                             label이 superview를 기준으로 위에서 75, 아래와 붙어 있도록 함.
               Fixed Width                    H:[button(50)]                              button의 가로는 50으로 고정.
               Fixed Height                   V:[button(50)]                              button의 세로는 50으로 고정.
               Width Constraint               H:[button(>=50)]                            button의 크기는 50보다 크거나 같아야 함.
               Vertical Layout                V:[topField]-10-[bottomField]               topField와 buttonField의 사이 간격은 10.
               Flush Views                    [maroonView][blueView]                      maroonView과 blueView 간격은 없음.
               Priority                       H:[button(100@20)]                          button의 가로는 100으로, 우선순위의 값을 20으로 설정
               Equal Widths                   H:[button1(==button2)]                      button1과 button2의 가로 길이는 동일하게 설정
               Multiple Predicates            H:[flexibleButton(>=70,<=100)]              flexibleButton의 가로 길이가 70보다 크거나 같고 100보다 작거나 같게 설정
               A Complete Line of Layout      |-[find]-[findNext]-[findField(>=20)]-|    find, findNext, findField와 superview의 사이는 표준간격이며, findField 크기는 20보다 크거나 같음.
               */
        
        let webViewBar = UIView()
        let backButton = UIButton()
        let testButton = UIButton()
        view.addSubview(webViewBar)
        
        //제약조건을 프로그래밍으로 할때는 뷰 자체적으로 수행하는 오토리사이징을 꺼야 함(이유 : 사용자가 지정한 오토레이아웃 조건과 충돌하여 제약조건 문제를 일으킴)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webViewBar.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        testButton.translatesAutoresizingMaskIntoConstraints = false
        let webViews = ["view":view!,
                            "webView":webView!,
                                "webViewBar":webViewBar,
                                    "backButton":backButton,
                                    "testButton":testButton]
        
        let horizontalWebView = NSLayoutConstraint.constraints(withVisualFormat: "H:|[webView]|",
                                                               options: NSLayoutConstraint.FormatOptions.alignAllCenterY,
                                                               metrics: nil,
                                                               views: webViews)
        
        let verticalWebView = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[webView][webViewBar]",
                                                               options: NSLayoutConstraint.FormatOptions.alignAllCenterX,
                                                               metrics: nil,
                                                               views: webViews)
        view.addConstraints(horizontalWebView)
        view.addConstraints(verticalWebView)
        //--------------------------------------------------  webView
        //오토레이 아웃연습하자...
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[webViewBar]|",
                                                                   options: NSLayoutConstraint.FormatOptions.alignAllCenterY,
                                                                   metrics: nil,
                                                                   views: webViews)
        
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[webViewBar(70)]|",
                                                                 options: NSLayoutConstraint.FormatOptions.alignAllCenterX,
                                                                 metrics: nil,
                                                                 views: webViews)
        view.addConstraints(horizontalConstraints)
        view.addConstraints(verticalConstraints)
        webViewBar.backgroundColor = .lightGray
        //--------------------------------------------------  webViewBar AutoLayout
        
        //--------------Button
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        webViewBar.addSubview(backButton)
        
        let horizontalBackButton = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[backButton(80)]", // 가로크기 80, 왼쪽으로 10 이동
                                                                  options: NSLayoutConstraint.FormatOptions.alignAllCenterY,
                                                                  metrics: nil,
                                                                  views: webViews)
        let verticalBackButton = NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[backButton(45)]",
                                                                options: NSLayoutConstraint.FormatOptions.alignAllCenterX,
                                                                metrics: nil,
                                                                views: webViews)
        webViewBar.addConstraints(horizontalBackButton)
        webViewBar.addConstraints(verticalBackButton)
        backButton.backgroundColor = .blue
        //--------------------------------------------------  backButton
        testButton.setTitle("test", for:.normal)
        testButton.addTarget(self, action:#selector(testButtonAction), for: .touchUpInside)
        webViewBar.addSubview(testButton) //-----> testButton Add
        
        let horizontaltestButton = NSLayoutConstraint.constraints(withVisualFormat: "H:[backButton]-20-[testButton(80)]", // 가로크기 80, 왼쪽으로 10 이동
                                                                  options: NSLayoutConstraint.FormatOptions.alignAllCenterY,
                                                                  metrics: nil,
                                                                  views: webViews)
        let verticaltestButton = NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[testButton(45)]",
                                                                options: NSLayoutConstraint.FormatOptions.alignAllCenterX,
                                                                metrics: nil,
                                                                views: webViews)
        webViewBar.addConstraints(horizontaltestButton)
        webViewBar.addConstraints(verticaltestButton)
        testButton.backgroundColor = .orange
        
    }
    
    
    //뒤로 가기
    @objc func backButtonAction(sender: UIButton!) {
        if(webView.canGoBack)
        {
            webView.goBack()
        }
        else {
            print("no back page")

        }
    }
    @objc func testButtonAction(sender: UIButton!) {

        //주소 변경 시도..
        let url = URL(string: "https://www.google.com")

        if(url == nil)
        {
        //3-2>  로컬파일 프로젝트 내에 있느 파일을 읽을때
            guard url == Bundle.main.url(forResource: "index", withExtension: "html")
                else {
                    print("path is nil")
                    return
            }
        }
        let request = URLRequest(url: url!);
        webView.load(request as URLRequest)
    }
        
        
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            //자바스크립트로 메시지를 전달할때
            if(message.name == "hello")
            {
                let data = message.body
                outputttext.text = data as? String
            }
            else if( message.name == "test"){
                let data = message.body
                outputttext.text = (data as! String)
            }
        }
        
}

