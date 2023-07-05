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


        view.backgroundColor = .white
        title = post?.title

        lazy var barButtomItem: UIBarButtonItem = {
            let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openInfoButton(_:)))
            barButtonItem.tintColor = .red
            return barButtonItem
        }()
        
        navigationItem.leftBarButtonItem = barButtomItem

    }

    @objc func openInfoButton(_: UIButton) {
        present(infoViewController, animated: true)
    }
}
