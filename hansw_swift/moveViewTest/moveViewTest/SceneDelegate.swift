//
//  SceneDelegate.swift
//  moveViewTest
//
//  Created by SANGWON HAN on 2020/05/28.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    enum ActionType: String {
        case searchAction = "SearchAction"
        case shareAction = "ShareAction"
        case favoriteAction = "FavoriteAction"
    }
    static let favoriteIdentifierInfoKey = "FavoriteIdentifier"
    
    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        if #available(iOS 13.0, *) {
            guard let _ = (scene as? UIWindowScene) else { return }
        } else {
            // Fallback on earlier versions
        }
    }

    @available(iOS 13.0, *)
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    @available(iOS 13.0, *)
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    @available(iOS 13.0, *)
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    @available(iOS 13.0, *)
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    @available(iOS 13.0, *)
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
//MARK:- 숏컷
    @available(iOS 13.0, *)
    func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        let handled = handleShortCutItem(shortcutItem: shortcutItem)
        completionHandler(handled)
    }

    // MARK: - Application Shortcut Support
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Quick Action", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    func handleShortCutItem(shortcutItem: UIApplicationShortcutItem) -> Bool {
        /** In this sample an alert is being shown to indicate that the action has been triggered,
            but in real code the functionality for the quick action would be triggered.
        */
        if let actionTypeValue = ActionType(rawValue: shortcutItem.type) {
            switch actionTypeValue {
            case .searchAction:
                showAlert(message: "Search triggered")
            case .shareAction:
                showAlert(message: "Share triggered")
            case .favoriteAction:
                // Go to that particular favorite shortcut.
                if let favoriteIdentifier = shortcutItem.userInfo?[SceneDelegate.favoriteIdentifierInfoKey] as? String {
                    // Find the favorite contact from the userInfo identifier.
                    if let foundFavoriteContact = ContactsData.shared.contact(favoriteIdentifier) {
                        // Go to that favorite contact.
                        if let navController = window?.rootViewController as? UINavigationController {
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            //이벤트 처리
                            // Pass the contact to the detail view controller and push it.
                            print("favoriteAction")
                            
                        }
                    }
                }
            }
        }
        return true
    }
}

