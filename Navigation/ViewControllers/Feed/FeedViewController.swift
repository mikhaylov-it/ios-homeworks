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
        view.backgroundColor = .black

        let button = UIButton(frame: CGRect(x: 150, y: 200, width: 80, height: 24))
        button.setTitle("К посту", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
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


