//
//  WebView.swift
//  moveViewTest
//
//  Created by SANGWON HAN on 2020/07/06.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

// 출처 : https://m.blog.naver.com/PostView.nhn?blogId=scw0531&logNo=221683538588&proxyReferer=https:%2F%2Fwww.google.com%2F

import UIKit
import WebKit

//네트워크 체크로직에 필요
import Foundation
import SystemConfiguration


class WebView: UIViewController, WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler {
    
    /*
    WKUIDelegate : JavaScript, 기타 플러그인 컨텐츠 이벤트를 캐치하여 동작. 웹 페이지 기본 사용자 인터페이스 요소를 제공
    WKNavigationDelegate : 프로토콜로 페이지의 start, loading, finish, error의 트리거 이벤트를 캐치하여 사용자 정의
     동작을 구현기능
    WKScriptMessageHandler : 프로토콜로 웹페이지에서 실행되는 JavaScript Message를 수신하는 방밥을 제공.
     웹 페이지에서 스크립트 메세지가 수신될 때 호출되는 userContentController를 정의하고 있다.
    */
    
    
    
    weak var webView: WKWebView!
    weak var outputttext: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initWebview_then_callFromJs()
        loadUrl(urlString: "")
        WebViews_AutoLayout()
        
        // netWork 연결상태 검사
        //checkNetworkConnect()
    }
    
    
    
//MARK:-  function
    
    //MARK: webView Load작업
    func loadUrl(urlString:String) {
        view.addSubview(webView)
        
        // WKWebview 셋팅
#if DEBUG
        //1. 로컬..
        //let url = URL(string: "http://127.0.0.1:8080/index.html")
        // --> 안됨
        
        //2. 웹
        //let url = URL(string: "https://www.google.com")
        
        //3-1> 앱 로컬 디렉토리에 있는 파일을 읽어 실행하는 방법
        // FileManager 인스턴스 생성
        let fileManager = FileManager()
        let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        do {
            // web디렉토리 URL을 가져오고
            let webURL = documentURL?.appendingPathComponent("Resource")
            // 디렉토리 내의 파일 목록을 출력해본다.
            //print("web directory Files : \(try FileManager.default.contentsOfDirectory(atPath : webURL!.path))")
            
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
#else
        let url = URL(string: urlString)

        if(url == nil)
        {
        //3-2>  로컬파일 프로젝트 내에 있느 파일을 읽을때
            guard url = Bundle.main.url(forResource: "index", withExtension: "html")
                else {
                    print("path is nil")
                    return
            }
        }
        let request = URLRequest(url: url);
        webView.load(request as URLRequest)
        
        
#endif
        webView.uiDelegate = self
        webView.navigationDelegate = self
        //WKWebview 뒤로가기, 앞으로가기 제스처 사용 ON
        webView.allowsBackForwardNavigationGestures = true
    }
    
    
    func initWebview_then_callFromJs() {
        //Javascript Call Fucntion Controller
        let contentController = WKUserContentController()
        let config = WKWebViewConfiguration()
        
        contentController.add(self, name: "hello")
        contentController.add(self, name: "test")
        
        config.userContentController = contentController
        webView = WKWebView(frame: self.view.frame, configuration: config)
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
        view.addSubview(webViewBar)
        
        //제약조건을 프로그래밍으로 할때는 뷰 자체적으로 수행하는 오토리사이징을 꺼야 함(이유 : 사용자가 지정한 오토레이아웃 조건과 충돌하여 제약조건 문제를 일으킴)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webViewBar.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        let webViews = ["view":view!, "webView":webView!, "webViewBar":webViewBar, "backButton":backButton]
        
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
        
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[webViewBar(100)]|",
                                                                 options: NSLayoutConstraint.FormatOptions.alignAllCenterX,
                                                                 metrics: nil,
                                                                 views: webViews)
        view.addConstraints(horizontalConstraints)
        view.addConstraints(verticalConstraints)
        webViewBar.backgroundColor = .lightGray
        //--------------------------------------------------  webViewBar AutoLayout
        
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
    }
    
    
    //MARK: 네트워크(인터넷) 연결을 확인하는 함수
    func checkNetworkConnet()
    {
        if self.isConnectedToNetwor(){
            print("Network Connection")
        }
        else {
            print("Network Not Connection")
            
            let networkCheckAlert = UIAlertController(title: "Network ERROR", message:"다시 시도해주시기 바랍니다.", preferredStyle: UIAlertController.Style.alert)
            
            networkCheckAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action:UIAlertAction) in
                print("")
                
                NativeFuc().back(mViewCon: self)
            }))
            
            self.present(networkCheckAlert, animated: true, completion: nil)
        }
        
        
        
    }
    
    //Network 설정정보를 얻어와 판단하는 로직  Cellular(LTE)와 WiFi 정보를 판단한다.
    func isConnectedToNetwor() -> Bool {
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1, {
                zeroSockAddress in SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            })
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        // Working for Cellular and WiFi
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        
        let ret = (isReachable && !needsConnection)
        
        return ret
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
    //앞으로 가기
    func forwardButtonAction() {
        if(webView.canGoForward){
            webView.goForward()
        }
        else {
            print("no forward page")
        }
    }
    //새로고침
    func refreshButtonAction() {
        print("refresh page")
        webView.reload()
    }
    
    
    //Native에서 JavaScritpt를 호출
    func jsCallButtonAction() {
        
        // Javascript Fucntion Setting
        let testhybridfunc = "testhybrid()"
        
        //Native -> JS Call
        webView.evaluateJavaScript(testhybridfunc) { (ScriptResult, error) in
            if let result = ScriptResult {
                print(result)
            }
        }
        //JavaScript
        /*
        function testhybrid(){
            alert('test call')
            return "success call"
         }
         */
    }
    
    func jsCallParamButtonAction(params:NSDictionary) {
        
        let name : String = params["name"] as! String
        let age : String = params["age"] as! String
        let address : String = params["address"] as! String
        
        //Javascript Function Setting (Param)
        let testhybridparamfunc = "testhybridparam('\(name)', '\(age)', '\(address)')"
        
        // Native -> JS Call (Parma)
        webView.evaluateJavaScript(testhybridparamfunc) { (ScriptResult, error) in
            if let result = ScriptResult {
                print(result)
            }
        }
        //JavaScript
        /*
        function testhybridparam(name, age, address){
            alert(name + '/'+ age + '/' + address)
            return "sccess param call"
         }
         */
    }
    
    
    
    
    
    
    //MARK:- WKScriptMessageHandler Delegate
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
    
    //MARK:- WKUIDelegate 프로토콜 메소스
    // 1
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: { (action) in
            completionHandler()
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    // 2
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: { (action) in
            completionHandler(true)
        }))
        alertController.addAction(UIAlertAction(title: "취소", style: .default, handler: { (action) in
            completionHandler(false)
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    // 3
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        
        let alertController = UIAlertController(title: "", message: prompt, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.text = defaultText
        }
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: { (action) in
            if let text = alertController.textFields?.first?.text{
                completionHandler(text)
            }
            else {
                completionHandler(defaultText)
            }
        }))
        alertController.addAction(UIAlertAction(title: "취소", style: .default, handler: { (action) in
            completionHandler(nil)
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    //WKNavigationDelegate 중복적으로 리로드 방지 (iOS9 이후 지원)
    public func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        webView.reload()
    }
}


