//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by NikkiLodeon on 6/14/23.
//

import UIKit

class ProfileHeaderView: UIView {

    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        let catAvatarImage = UIImage(named: "cat")

        imageView.layer.cornerRadius = 150 / 2
        imageView.clipsToBounds = true

        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)

        imageView.image = catAvatarImage
        imageView.toAutoLayout()

        return imageView
    }()

    lazy var fullNameLabel: UILabel = {
        let name = UILabel()
        name.text = "Mr.Cat"
        name.font = .boldSystemFont(ofSize: 18)
        name.toAutoLayout()

        return name
    }()

    lazy var statusLabel: UILabel = {
        let status = UILabel()
        status.text = "Waiting for something..."
        status.textColor = .gray
        status.font = .systemFont(ofSize: 14)
        status.toAutoLayout()

        return status
    }()

    lazy var statusTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Whats up?"
        field.backgroundColor = .white
        field.font = .systemFont(ofSize: 15)
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.layer.cornerRadius = 40 / 4

        field.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        field.toAutoLayout()

        return field
    }()

    lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Set status", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 40 / 4
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.8
        button.layer.shadowRadius = 3

        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.toAutoLayout()

        return button
    }()

    private lazy var statusText: String = ""

    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
        setConstraints()

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

    }

    @objc func buttonPressed() {
        statusLabel.text = statusText

    }

    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = statusTextField.text!

    }

    private func initViews() {
        addSubviews(avatarImageView,
                    fullNameLabel,
                    statusLabel,
                    statusTextField,
                    setStatusButton)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([

                avatarImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
                avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                avatarImageView.widthAnchor.constraint(equalToConstant: 150),
                avatarImageView.heightAnchor.constraint(equalToConstant: 150),

                fullNameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 60),
                fullNameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 27),
                fullNameLabel.rightAnchor.constraint(equalTo: rightAnchor),
                fullNameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -20),

                statusLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 20),
                statusLabel.rightAnchor.constraint(equalTo: fullNameLabel.rightAnchor, constant: -20),
                statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 20),
                statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -20),

                statusTextField.leftAnchor.constraint(equalTo: statusLabel.leftAnchor),
                statusTextField.heightAnchor.constraint(equalToConstant: 40),
                statusTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
                statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -20),

                setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20),
                setStatusButton.leftAnchor.constraint(equalTo: avatarImageView.leftAnchor),
                setStatusButton.rightAnchor.constraint(equalTo: statusTextField.rightAnchor),
                setStatusButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
