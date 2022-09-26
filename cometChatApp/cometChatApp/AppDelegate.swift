//
//  AppDelegate.swift
//  cometChatApp
//
//  Created by Margels on 26/09/22.
//

import UIKit
import CometChatPro

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // define app id and region from CometChat's dashboard.
    let appId = "APP_ID"
    let region = "APP_REGION"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // create mySettings object to initialize CometChat.
        let mySettings = AppSettings.AppSettingsBuilder().subscribePresenceForAllUsers().setRegion(region: region).build()
        
        // perform initialization upon launch.
        CometChat(appId: appId ,appSettings: mySettings,onSuccess: { (isSuccess) in
            
            // print success message in console.
            print("CometChat Pro SDK initialised successfully.")
            
        // catch any errors.
        }) { (error) in
            
            // print error message in console.
            print("CometChat Pro SDK failed to initialise with error: \(error.errorDescription)")
            }

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

