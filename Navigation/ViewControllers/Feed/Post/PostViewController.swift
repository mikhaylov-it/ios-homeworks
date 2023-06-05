//
//  PostViewController.swift
//  Navigation
//
//  Created by NikkiLodeon on 6/3/23.
//

import UIKit

class PostViewController: UIViewController {
    var post: Post?
    let infoViewController = InfoViewController()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .darkGray
        title = post?.title

        let barButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(openInfoButton(_:)))

        navigationItem.leftBarButtonItem = barButtonItem
    }

    @objc func openInfoButton(_: UIButton) {
        present(
            infoViewController,
            animated: true)
        print("Tap")
    }
}
