//
//  LogInViewController.swift
//  Navigation
//
//  Created by NikkiLodeon on 6/22/23.
//

import UIKit

class LogInViewController: UIViewController {

    private lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        let image = UIImage(named: "logo")

        logoImageView.image = image
        logoImageView.toAutoLayout()

        return logoImageView
    }()

    private lazy var authStackView: UIStackView = {
        let authStackView = UIStackView()

        authStackView.addSubviews(emailTextField, passTextField)
        authStackView.layer.borderColor = UIColor.lightGray.cgColor
        authStackView.layer.borderWidth = 0.5
        authStackView.layer.cornerRadius = 10
        authStackView.toAutoLayout()

        return authStackView
    }()

    private lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()

        emailTextField.backgroundColor = .systemGray6
        emailTextField.textColor = .black
        emailTextField.font = .systemFont(ofSize: 16, weight: .medium)
        emailTextField.tintColor = UIColor(named: "accentColor")
        emailTextField.placeholder = "Email or phone"
        emailTextField.autocapitalizationType = .none
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.layer.borderWidth = 0.25
        emailTextField.toAutoLayout()

        return emailTextField
    }()

    private lazy var passTextField: UITextField = {
        let passTextField = UITextField()

        passTextField.backgroundColor = .systemGray6
        passTextField.textColor = .black
        passTextField.font = .systemFont(ofSize: 16, weight: .medium)
        passTextField.tintColor = UIColor(named: "accentColor")
        passTextField.autocapitalizationType = .none
        passTextField.isSecureTextEntry = true
        passTextField.placeholder = "Password"
        passTextField.layer.borderColor = UIColor.lightGray.cgColor
        passTextField.layer.borderWidth = 0.25
        passTextField.toAutoLayout()


        return passTextField
    }()

    private lazy var logInButton: UIButton = {
        let logInButton = UIButton()

        switch logInButton.state {

        case .selected: logInButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
            logInButton.alpha = 0.8
        case .highlighted: logInButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
            logInButton.alpha = 0.8
        case .disabled: logInButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
            logInButton.alpha = 0.8

        default: logInButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
            logInButton.alpha = 1

        }
        logInButton.setTitle("LogIn", for: .normal)
        logInButton.tintColor = .white
        logInButton.layer.cornerRadius = 1
        logInButton.toAutoLayout()

        return logInButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubviews(logoImageView, authStackView, logInButton)
        setConstraints()


    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            authStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            authStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            authStackView.heightAnchor.constraint(equalToConstant: 100),
            authStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),

            emailTextField.widthAnchor.constraint(equalTo: authStackView.widthAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.topAnchor.constraint(equalTo: authStackView.topAnchor),
            emailTextField.bottomAnchor.constraint(equalTo: passTextField.topAnchor),

            passTextField.widthAnchor.constraint(equalTo: authStackView.widthAnchor),
            passTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            passTextField.bottomAnchor.constraint(equalTo: authStackView.bottomAnchor),

            logInButton.topAnchor.constraint(equalTo: authStackView.bottomAnchor, constant: 16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.leftAnchor.constraint(equalTo: authStackView.leftAnchor),
            logInButton.rightAnchor.constraint(equalTo: authStackView.rightAnchor)
        ])
    }
}
