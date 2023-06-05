//
//  FeedViewController.swift
//  Navigation
//
//  Created by NikkiLodeon on 6/3/23.
//

import UIKit

struct Post {
    let title: String
}

class FeedViewController: UIViewController {

    let post = Post(title: "Title of Post")
    let postViewController = PostViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        navigationItem.title = "Feed"

        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(
            tabBarSystemItem: .favorites,
            tag: 0)
        tabBarItem.title = "Feed"
        self.tabBarItem = tabBarItem

        let button = UIButton(frame: CGRect(x: 140, y: 200, width: 100, height: 10))
        button.setTitle("К посту", for: .normal)
        view.addSubview(button)
        button.addTarget(
            self,
            action: #selector(openPostButton(_: )),
            for: .touchUpInside)
        
        postViewController.post = post

    }
    @objc func openPostButton(_: UIButton) {
        navigationController?.pushViewController(
            postViewController,
            animated: true)
    }

}


