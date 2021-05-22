

import UIKit

// this example is no longer in the book; no one pulls a v.c. from a xib nowadays

@UIApplicationMain
class AppDelegate : UIResponder, UIApplicationDelegate {
    var window : UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        
        self.window = self.window ?? UIWindow()
        
        let arr = UINib(nibName: "Main", bundle: nil)
            .instantiate(withOwner:nil)
        self.window!.rootViewController = arr[0] as? UIViewController
        
        self.window!.backgroundColor = UIColor.white
        self.window!.makeKeyAndVisible()
        return true
    }
}
