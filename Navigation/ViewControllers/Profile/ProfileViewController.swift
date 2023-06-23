//
//  ViewController.swift
//  Navigation
//
//  Created by NikkiLodeon on 6/1/23.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView = ProfileHeaderView()

    lazy var somethingBottomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tap me", for: .normal)
        button.backgroundColor = .red
        button.toAutoLayout()

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        view.addSubviews(profileHeaderView, somethingBottomButton)
        addConstraints()


        profileHeaderView.frame = view.frame
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            profileHeaderView.leftAnchor.constraint(equalTo: view.leftAnchor),
            profileHeaderView.rightAnchor.constraint(equalTo: view.rightAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),

            somethingBottomButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            somethingBottomButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            somethingBottomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }


}

