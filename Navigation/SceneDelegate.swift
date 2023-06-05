//
//  SceneDelegate.swift
//  Navigation
//
//  Created by NikkiLodeon on 6/1/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: scene)

        let profileViewController = ProfileViewController()
        let feedViewController = FeedViewController()

        let tabBarViewController = UITabBarController()
        let controllers = [feedViewController, profileViewController]
        tabBarViewController.viewControllers = controllers.map {
            UINavigationController(rootViewController: $0)
        }

        window.rootViewController = tabBarViewController
        window.makeKeyAndVisible()

        self.window = window
    }
}
