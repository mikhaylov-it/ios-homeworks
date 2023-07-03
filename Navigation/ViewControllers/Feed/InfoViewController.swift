//
//  InfoViewController.swift
//  Navigation
//
//  Created by NikkiLodeon on 6/5/23.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        lazy var alertButton: UIButton = {
            let button = UIButton()
            button.frame = CGRect(x: 0, y: 40, width: 380, height: 40)
            button.backgroundColor = .systemRed
            button.setTitle("Bring out the alarm", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(showAlert(_:)), for: .touchUpInside)

            return button
        }()

        view.addSubview(alertButton)

    }
    @objc func showAlert(_: UIButton) {
        let alert = UIAlertController(
            title: "Title",
            message: "Message",
            preferredStyle: .alert)
        let firstAction = UIAlertAction(
            title: "Message #1",
            style: .default,
            handler: { _ in NSLog("Tapped 1")})
        let secondAction = UIAlertAction(
            title: "Message #2",
            style: .default,
            handler: { _ in NSLog("Tapped 2")})

        alert.addAction(firstAction)
        alert.addAction(secondAction)
        self.present(alert, animated: true)

    }
}
