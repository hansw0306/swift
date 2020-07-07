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
    
    
    
    weak var webview: WKWebView!
    weak var outputttext: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initWebview_then_callFromJs()
        loadUrl(urlString: "")
        
        
        // netWork 연결상태 검사
        //checkNetworkConnect()
    }
    
    
    
//MARK:-  function
    func loadUrl(urlString:String) {
        view.addSubview(webview)
        
        // WKWebview 셋팅
#if DEBUG
        let url = URL(string: "http://127.0.0.1:8088/index.html") //로컬..
        //let url = Bundle(for: type(of: self)).url(forResource: "index", withExtension:"html")
#else
        let url = URL(string: urlString)
#endif
        let request = URLRequest(url: url!);
        
        webview.load(request)
        
        webview.uiDelegate = self
        webview.navigationDelegate = self
    }
    
    
    func initWebview_then_callFromJs() {
        //Javascript Call Fucntion Controller
        let contentController = WKUserContentController()
        let config = WKWebViewConfiguration()
        
        contentController.add(self, name: "hello")
        contentController.add(self, name: "test")
        
        config.userContentController = contentController
        
        webview = WKWebView(frame: CGRect(x: 0, y: 44, width: self.view.frame.size.width, height: 404), configuration:config)
    }
    
    func checkNetworkConnet()
    {
        
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
    
    
    
    //MARK:- WKScriptMessageHandler Delegate
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        //자바스크립트로 메시지를 전달할때
        if(message.name == "hello")
        {
            var data = message.body
            outputttext.text = data as! String
        }
        else if( message.name == "test"){
            var data = message.body
            outputttext.text = data as! String
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


