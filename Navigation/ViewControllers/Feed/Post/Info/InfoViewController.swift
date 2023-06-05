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

        view.backgroundColor = .darkGray

        let alertButton = UIButton(frame:   CGRect(x: 140, y: 200, width: 100, height: 10))
        alertButton.setTitle("To Alert", for: .normal)
        alertButton.addTarget(self, action: #selector(showAlert(_:)), for: .touchUpInside)
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
