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

        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        title = post?.title

        lazy var addBarButtomItem: UIBarButtonItem = {
            let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openInfoButton(_:)))
            barButtonItem.tintColor = .red
            return barButtonItem
        }()
        
        navigationItem.leftBarButtonItem = addBarButtomItem
    }

    @objc func openInfoButton(_: UIButton) {
        present(infoViewController, animated: true)
    }
}
