//
//  HomeViewController.swift
//  cometChatApp
//
//  Created by Margels on 26/09/22.
//

import UIKit
import CometChatPro

// in the storyboard, assign this class to the tab bar controller by opening the inspector and heeading over to the identity inspector tab. In the Custom Class section, select the first text field and enter HomeViewController. Remember to also delete
class HomeViewController: UITabBarController {

    // MARK: - View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setViewControllers()
        
    }
    
    
    
    // MARK: - Functions

    // set up navigation bar
    func setUpViews() {
        
        // hide back button and nav bar
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.isHidden = true
        
    }

    // define tab bar's view controllers
    func setViewControllers() {
        
        // perform action on main thread
        DispatchQueue.main.async {

            // chats view controller
            let chats = CometChatConversationList()
            chats.tabBarItem = UITabBarItem(title: "Chats", image: UIImage(systemName: "bubble.left.and.bubble.right.fill"), tag: 0)
            chats.set(title: "Chats", mode: .automatic)
            chats.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(self.logoutTapped))
            let chatsNav = UINavigationController(rootViewController: chats)

            // people view controller
            let people = CometChatUserList()
            people.tabBarItem = UITabBarItem(title: "People", image: UIImage(systemName: "person.2.fill"), tag: 1)
            people.set(title: "People", mode: .automatic)
            people.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(self.logoutTapped))
            let peopleNav = UINavigationController(rootViewController: people)

            // groups view controller
            let groups = CometChatGroupList()
            groups.tabBarItem = UITabBarItem(title: "Groups", image: UIImage(systemName: "person.3.fill"), tag: 2)
            let groupsNav = UINavigationController(rootViewController: groups)

            // assign to tab bar
            self.viewControllers = [chatsNav, peopleNav, groupsNav]

        }

        
    }
    
    // logout action
    @objc func logoutTapped() {
        
        // perform logout and catch errors
        CometChat.logout { Response in
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        } onError: { error in
            print("Error logging out: \(error.errorDescription)")
        }
        
    }
}
