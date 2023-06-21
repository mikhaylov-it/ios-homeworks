//
//  SceneDelegate.swift
//  Navigation
//
//  Created by NikkiLodeon on 6/1/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var tabBarViewController = UITabBarController()
    var feedViewController = FeedViewController()
    var profileViewController = ProfileViewController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: scene)

        feedViewController = FeedViewController()
        feedViewController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(named: "FeedImage"), tag: 0)

        profileViewController = ProfileViewController()
        profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "ProfileImage"), tag: 1)

        
        tabBarViewController = UITabBarController()
        tabBarViewController.tabBar.tintColor = .red
        tabBarViewController.tabBar.backgroundColor = .white

        let controllers = [feedViewController, profileViewController]
        tabBarViewController.viewControllers = controllers.map {
            UINavigationController(rootViewController: $0)
        }

        window.rootViewController = tabBarViewController
        window.makeKeyAndVisible()
        self.window = window
    }
}

