//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by NikkiLodeon on 6/14/23.
//

import UIKit

class ProfileHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        let views: [UIView] = [avatarImageView,
                               fullNameLabel,
                               statusLabel,
                               statusTextField,
                               setStatusButton,
                               somethingBottomButton]
        for subView in views {
            addSubview(subView)
        }
        setConstraintsForAvatarImageView()
        setConstraintsForfullNameLabel()
        setConstraintsForStatusLabel()
        setConstraintsForStatusTextField()
        setConstraintsForSetStatusButton()
        setConstraintsForSomethingBottomButton()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }


    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        let catImage = UIImage(named: "cat")
        imageView.frame = CGRect(origin: CGPoint(x: 26, y: 46), size: CGSize(width: 150, height: 150))

        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.clipsToBounds = true

        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)

        imageView.image = catImage
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    lazy var fullNameLabel: UILabel = {
        let name = UILabel()
        name.text = "Mr.Cat"
        name.font = .boldSystemFont(ofSize: 18)
        name.frame = CGRect(origin: CGPoint(x: 190, y: 30), size: CGSize(width: 200, height: 100))
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()

    lazy var statusLabel: UILabel = {
        let status = UILabel()
        status.text = "Waiting for something..."
        status.textColor = .gray
        status.frame = CGRect(origin: CGPoint(x: 190, y: 100), size: CGSize(width: 200, height: 100))
        status.font = .systemFont(ofSize: 14)
        status.translatesAutoresizingMaskIntoConstraints = false

        return status
    }()

    lazy var statusTextField: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 190, y: 170, width: 170, height: 30)
        field.placeholder = "Whats up?"
        field.backgroundColor = .white
        field.font = .systemFont(ofSize: 15)
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.layer.cornerRadius = field.frame.height / 4
        field.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        field.translatesAutoresizingMaskIntoConstraints = false

        return field
    }()

    lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(origin: CGPoint(x: 26, y: 220), size: CGSize(width: 324, height: 60))
        button.setTitle("Set status", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = button.frame.height / 4
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.8
        button.layer.shadowRadius = 3

        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    lazy var somethingBottomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tap me", for: .normal)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var statusText: String = ""



    @objc func buttonPressed() {
        statusLabel.text = statusText

    }

    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = statusTextField.text!

    }

    func setConstraintsForAvatarImageView() {
        avatarImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }

    func setConstraintsForfullNameLabel() {
        fullNameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 60).isActive = true
        fullNameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 27).isActive = true
        fullNameLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        fullNameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -20).isActive = true
    }

    func setConstraintsForStatusLabel() {
        statusLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 20).isActive = true
        statusLabel.rightAnchor.constraint(equalTo: fullNameLabel.rightAnchor, constant: -20).isActive = true
        statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 20).isActive = true
        statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -20).isActive = true
    }

    func setConstraintsForStatusTextField() {
        statusTextField.leftAnchor.constraint(equalTo: statusLabel.leftAnchor).isActive = true
        statusTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        statusTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -20).isActive = true
    }

    func setConstraintsForSetStatusButton() {
        setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20).isActive = true
        setStatusButton.leftAnchor.constraint(equalTo: avatarImageView.leftAnchor).isActive = true
        setStatusButton.rightAnchor.constraint(equalTo: statusTextField.rightAnchor).isActive = true
        setStatusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    func setConstraintsForSomethingBottomButton() {
        somethingBottomButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        somethingBottomButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        somethingBottomButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
