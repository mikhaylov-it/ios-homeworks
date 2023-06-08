//
//  FeedViewController.swift
//  Navigation
//
//  Created by NikkiLodeon on 6/3/23.
//

import UIKit

class FeedViewController: UIViewController {
    let post = Post(title: "Title of Post")
    let postViewController = PostViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        var postView: UIView {
            let post = UIView()
            post.frame = CGRect(x: 20, y: 50, width: 330, height: 100)
            post.layer.backgroundColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
            post.layer.borderWidth = 2

            return post
        }

        var titleOfPost: UILabel {
            let titleOfPost = UILabel()
            titleOfPost.text = post.title
            titleOfPost.frame = CGRect(x: 40, y: 30, width: 200, height: 100)

            return titleOfPost
        }

        var transitionToPostButton: UIButton {
            let button = UIButton()
            button.frame = CGRect(x: 20, y: 50, width: 330, height: 100)
            button.setTitleColor(.white, for: .normal)
            button.addTarget(
                self,
                action: #selector(openPostButton(_: )),
                for: .touchUpInside)

            return button
        }
        view.addSubview(postView)
        view.addSubview(titleOfPost)
        view.addSubview(transitionToPostButton)
        postViewController.post = post

    }
    @objc func openPostButton(_: UIButton) {
        navigationController?.pushViewController(
            postViewController,
            animated: true)
    }

}


