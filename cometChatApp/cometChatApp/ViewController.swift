//
//  ViewController.swift
//  cometChatApp
//
//  Created by Margels on 26/09/22.
//

import UIKit
import CometChatPro

class ViewController: UIViewController {

    
// MARK: - View did load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // insert your user's uid and your CometChat account's Auth Key.
        let uid = "SUPERHERO1"
        let authKey = "AUTH_KEY"
        
        // perform user login.
        CometChat.login(UID: uid, apiKey: authKey, onSuccess: { (user) in
            
            // define behavior if login was successful.
            print("Login successful: " + user.stringValue())
            self.openChat()
        
        // catch any errors.
        }) { (error) in
            
            // display error message.
            print("Login failed with error: " + error.errorDescription)
            
        }

    }
    
    
    
// MARK: - Functions
    
    // open CometChat's UI
    func openChat() {
        
        // perform action on main thread
        DispatchQueue.main.async {
           let cometChatUI = CometChatUI()
           cometChatUI.setup(withStyle: .fullScreen)
           self.present(cometChatUI, animated: true, completion: nil)
        }
    
    }
    
    // open group chats
    func openGroupChat() {
        
        // perform action on main thread
        DispatchQueue.main.async {
           let messageList = CometChatMessageList()
           let group = Group(guid: "supergroup", name: "Comic Heros' Hangout", groupType: .public, password: nil)
           messageList.set(conversationWith: group, type: .group)
           self.navigationController?.pushViewController(messageList, animated: true)
        }

    }

}
