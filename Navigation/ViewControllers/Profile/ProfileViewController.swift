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
        
        view.addSubview(profileHeaderView)

        profileHeaderView.frame = view.frame
        setConstraintsForProfileHeaderView()
        
    }

    func setConstraintsForProfileHeaderView() {
        profileHeaderView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        profileHeaderView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        profileHeaderView.heightAnchor.constraint(equalToConstant: 220).isActive = true
    }
}

