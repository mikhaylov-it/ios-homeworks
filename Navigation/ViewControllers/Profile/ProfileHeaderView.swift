//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by NikkiLodeon on 6/14/23.
//

import UIKit

class ProfileHeaderView: UIView {

    var profileImageView: UIImageView {
        let imageView = UIImageView()
        let catImage = UIImage(named: "cat")
        imageView.frame = CGRect(origin: CGPoint(x: 26, y: 46), size: CGSize(width: 150, height: 150))

        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.clipsToBounds = true

        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)

        imageView.image = catImage

        return imageView
    }

    var profileName: UILabel {
        let name = UILabel()
        name.text = "Mr.Cat"
        name.font = .boldSystemFont(ofSize: 24)
        name.frame = CGRect(origin: CGPoint(x: 190, y: 30), size: CGSize(width: 200, height: 100))

        return name
    }

   lazy var statusLabel: UILabel = {
        let status = UILabel()
        status.text = "Waiting for something..."
       status.textColor = UIColor.red
        status.frame = CGRect(origin: CGPoint(x: 190, y: 100), size: CGSize(width: 200, height: 100))
        status.font = .systemFont(ofSize: 15)

        return status
    }()

    var statusButton: UIButton {
        let button = UIButton()
        button.frame = CGRect(origin: CGPoint(x: 26, y: 220), size: CGSize(width: 324, height: 60))
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = button.frame.height / 4
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.8
        button.layer.shadowRadius = 3

        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        return button
    }

    lazy var statusTextField: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 190, y: 170, width: 170, height: 30)
        field.placeholder = "Whats up?"
        field.backgroundColor = .white
        field.font = .systemFont(ofSize: 14)
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.layer.cornerRadius = field.frame.height / 4
        field.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)

        return field
    }()
    private var statusText: String = ""

    @objc func buttonPressed() {
        print("ddd")
        statusLabel.text = statusText

    }

    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = statusTextField.text!

    }

}
