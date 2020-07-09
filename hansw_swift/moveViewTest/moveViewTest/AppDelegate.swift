//
//  AppDelegate.swift
//  moveViewTest
//
//  Created by SANGWON HAN on 2020/05/28.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 프로젝트의 리소스를 앱 내의 Documents 폴더에 넣으려고 한다
        // *조건 : 앱을 최초 실행할때만 작업하도록 하기위해 UserDefaults를 사용한다.
        if UserDefaults.standard.bool(forKey: "firstLaunch") == false {
            
            UserDefaults.standard.set(true, forKey: "firstLaunch")
            UserDefaults.standard.synchronize()
            
            let fileManager = FileManager.default
            let fileNames = ["index.html", "Resource.zip"]
            
            let documentsUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0] as URL
            let bundleUrl = Bundle.main.resourceURL
            
            for file in fileNames {
                if let srcPath = bundleUrl?.appendingPathComponent(file).path{
                    
                    let toPath = documentsUrl.appendingPathComponent(file).path
                    do{
                        try fileManager.copyItem(atPath: srcPath, toPath: toPath)
                    }
                    catch{
                        print("error")
                    }
                }
            }
        }
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

