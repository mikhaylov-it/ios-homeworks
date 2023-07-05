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

    private lazy var postView: UIView = {
        let post = UIView()
        post.layer.backgroundColor = UIColor.white.cgColor
        post.layer.borderWidth = 2
        post.toAutoLayout()
        return post
    }()

    private lazy var titleOfPost: UILabel = {
        let titleOfPost = UILabel()
        titleOfPost.text = post.title
        titleOfPost.toAutoLayout()
        return titleOfPost
    }()

    private lazy var someStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.toAutoLayout()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .yellow
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        return stackView
    }()

    private lazy var firstButton: UIButton = {
        let button = UIButton()
        button.setTitle("First Tap", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .green
        button.toAutoLayout()
        button.addTarget(self, action: #selector(openPostButton), for: .touchUpInside)
        return button
    }()

    private lazy var secondButton: UIButton = {
        let button = UIButton()
        button.setTitle("Second Tap", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .red
        button.toAutoLayout()
        button.addTarget(self, action: #selector(openPostButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubviews(postView, titleOfPost, someStackView)
        setConstraints()

        postViewController.post = post

    }



    private func setConstraints() {
        NSLayoutConstraint.activate([
            someStackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            someStackView.rightAnchor.constraint(equalTo: view.rightAnchor),
            someStackView.heightAnchor.constraint(equalToConstant: 200),
            someStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            postView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            postView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            postView.heightAnchor.constraint(equalToConstant: 200),
            postView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),

            titleOfPost.topAnchor.constraint(equalTo: postView.topAnchor),
            titleOfPost.centerXAnchor.constraint(equalTo: postView.centerXAnchor)

        ])
    }

    @objc func openPostButton(_: UIButton) {
        navigationController?.pushViewController(
            postViewController,
            animated: true)
    }


}


