//
//  ViewController.swift
//  Navigation
//
//  Created by NikkiLodeon on 6/1/23.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        navigationItem.title = "Profile"

        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(
            tabBarSystemItem: .bookmarks,
            tag: 1)
        tabBarItem.title = "Profile"
        self.tabBarItem = tabBarItem
    }


}

