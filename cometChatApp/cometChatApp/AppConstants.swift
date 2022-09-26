//
//  AppConstants.swift
//  cometChatApp
//
//  Created by Margels on 26/09/22.
//

import Foundation
import CometChatPro

class appConstants {
    
    // optional: define your CometChat account details here and use also in other view controllers (appConstants.appId, appConstants.region, appConstants.authKey)
    static let appId = "APP_ID"
    static let region = "APP_REGION"
    static let authKey = "AUTH_KEY"
    
    
    // optional: define your initialization function here for your AppDelegate file
    static func setUp() {
        
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
        
        // updateSettings()

    }
    
    // optional: customize CometChat's UI Kit
    static func updateSettings() {
        
        // change CometChat's colors to match your project appearance.
        UIKitSettings.primaryColor = .systemRed
        UIKitSettings.backgroundColor = .systemBackground
        UIKitSettings.EmailIDColor = .systemRed
        UIKitSettings.PhoneNumberColor = .systemRed
        UIKitSettings.PhoneNumberSelectedColor = .systemBlue
        
        // enable media messages betweeen users.
        UIKitSettings.sendPhotoVideos = .enabled
        
        // enable group video calls amongst users.
        UIKitSettings.groupVideoCall = .enabled
        
        // enable mentions in group chats.
        UIKitSettings.mentions = .enabled

        // enable GIFs messages.
        UIKitSettings.sendGifs = .enabled

        // enable users to share location.
        UIKitSettings.shareLocation = .enabled

        // enable call recording.
        UIKitSettings.callRecording = .enabled
        
        // enable link previews.
        UIKitSettings.linkPreview = .enabled
        
    }
    
}
