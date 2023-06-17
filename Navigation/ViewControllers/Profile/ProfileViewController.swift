//
//  ViewController.swift
//  Navigation
//
//  Created by NikkiLodeon on 6/1/23.
//

import UIKit

class ProfileViewController: UIViewController {
    let profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        let views: [UIView] = [profileHeaderView.profileImageView, profileHeaderView.profileName, profileHeaderView.statusLabel, profileHeaderView.statusButton, profileHeaderView.statusTextField]
        for subView in views {
            view.addSubview(subView)
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        profileHeaderView.frame = view.frame
        
    }


}

