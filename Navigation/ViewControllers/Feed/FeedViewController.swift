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
        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)

        lazy var postView: UIView = {
            let post = UIView()
            post.frame = CGRect(x: 20, y: 50, width: 330, height: 100)
            post.layer.backgroundColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
            post.layer.borderWidth = 2

            return post
        }()

        lazy var titleOfPost: UILabel = {
            let titleOfPost = UILabel()
            titleOfPost.text = post.title
            titleOfPost.frame = CGRect(x: 40, y: 30, width: 200, height: 100)

            return titleOfPost
        }()

        let someStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.distribution = .fillEqually

            let firstButton: UIButton = {
                let button = UIButton()
                button.setTitle("First Tap", for: .normal)
                button.setTitleColor(.black, for: .normal)
                stackView.translatesAutoresizingMaskIntoConstraints = false
                button.addTarget(self, action: #selector(openPostButton), for: .touchUpInside)
                return button
            }()

            let secondButton: UIButton = {
                let button = UIButton()
                button.setTitle("Second Tap", for: .normal)
                button.setTitleColor(.black, for: .normal)
                stackView.translatesAutoresizingMaskIntoConstraints = false
                button.addTarget(self, action: #selector(openPostButton), for: .touchUpInside)
                return button
            }()

            func setConstraintsForFirstButton(){
                firstButton.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
                firstButton.bottomAnchor.constraint(equalTo: secondButton.topAnchor, constant: -10).isActive = true
                firstButton.heightAnchor.constraint(equalToConstant: 10).isActive = true
            }

            func setConstraintsForSecondButton(){
                secondButton.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
                secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 10).isActive = true
                secondButton.heightAnchor.constraint(equalToConstant: 10).isActive = true
            }

            stackView.addArrangedSubview(firstButton)
            stackView.addArrangedSubview(secondButton)

            setConstraintsForFirstButton()
            setConstraintsForSecondButton()

            return stackView
        }()

        func setConstraintsForSomeStackView() {
            someStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            someStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            

        }

        view.addSubview(postView)
        view.addSubview(titleOfPost)
        view.addSubview(someStackView)
        setConstraintsForSomeStackView()

        postViewController.post = post

    }

    @objc func openPostButton(_: UIButton) {
        navigationController?.pushViewController(
            postViewController,
            animated: true)
    }


}


