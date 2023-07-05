//
//  LogInViewController.swift
//  Navigation
//
//  Created by NikkiLodeon on 6/22/23.
//

import UIKit

class LogInViewController: UIViewController {

    private let profileViewController = ProfileViewController()
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.toAutoLayout()

        return scrollView
    }()

    private var contentView: UIView = {
        let contentView = UIView()
        contentView.toAutoLayout()

        return contentView
    }()

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
        authStackView.clipsToBounds = true
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
        emailTextField.returnKeyType = UIReturnKeyType.done
        emailTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        emailTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
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
        passTextField.autocapitalizationType = .none
        passTextField.returnKeyType = UIReturnKeyType.done
        passTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        passTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
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
        logInButton.layer.cornerRadius = 10
        logInButton.clipsToBounds = true

        logInButton.toAutoLayout()
        logInButton.actions(forTarget: self, forControlEvent: .touchUpInside)

        return logInButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(logoImageView, authStackView, logInButton)

        setConstraints()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setupKeyboardObservers()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        setupKeyboardObservers()
    }

    @objc func openProfileViewController() {
        self.present(profileViewController, animated: true, completion: nil)
    }

    @objc func willShowKeyboard(_ notification: NSNotification) {
            let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
            scrollView.contentInset.bottom += keyboardHeight ?? 0.0
        }

    @objc func willHideKeyboard(_ notification: NSNotification) {
            scrollView.contentInset.bottom = 0.0
        }

    private func setupKeyboardObservers() {
            let notificationCenter = NotificationCenter.default

            notificationCenter.addObserver(
                self,
                selector: #selector(self.willShowKeyboard(_:)),
                name: UIResponder.keyboardWillShowNotification,
                object: nil
            )

            notificationCenter.addObserver(
                self,
                selector: #selector(self.willHideKeyboard(_:)),
                name: UIResponder.keyboardWillHideNotification,
                object: nil
            )
        }

        private func removeKeyboardObservers() {
            let notificationCenter = NotificationCenter.default
            notificationCenter.removeObserver(self)
        }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),

            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            logoImageView.topAnchor.constraint(lessThanOrEqualTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            authStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            authStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
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
