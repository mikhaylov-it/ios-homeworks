//
//  ViewController.swift
//  Navigation
//
//  Created by NikkiLodeon on 6/1/23.
//

import UIKit

class ProfileViewController: UIViewController {

    private let profileHeaderView = ProfileHeaderView()

    private lazy var somethingBottomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tap me", for: .normal)
        button.backgroundColor = .red
        button.toAutoLayout()

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubviews(profileHeaderView, somethingBottomButton)
        setConstraints()


        profileHeaderView.frame = view.frame
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            profileHeaderView.leftAnchor.constraint(equalTo: view.leftAnchor),
            profileHeaderView.rightAnchor.constraint(equalTo: view.rightAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),

            somethingBottomButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            somethingBottomButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            somethingBottomButton.topAnchor.constraint(equalTo: profileHeaderView.bottomAnchor),
            somethingBottomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }


}

