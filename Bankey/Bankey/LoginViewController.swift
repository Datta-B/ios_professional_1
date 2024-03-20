//
//  ViewController.swift
//  Bankey
//
//  Created by Apple on 19/03/24.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView    = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMsgLb   = UILabel()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    
    var userName: String? {
        return loginView.userNameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextFiled.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        style()
        layout()
        
    }

}

extension LoginViewController {
    private func style() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.text = "Bankey"
       // titleLabel.alpha = 0
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.numberOfLines = 0
        subtitleLabel.text = "Your premium source for all things banking!"
       // subtitleLabel.alpha = 0
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMsgLb.translatesAutoresizingMaskIntoConstraints = false
        errorMsgLb.textAlignment = .center
        errorMsgLb.textColor = .systemRed
        errorMsgLb.numberOfLines = 0
        errorMsgLb.text = "username/password cannot be blank"
        errorMsgLb.isHidden = true
        
    }
    
   
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMsgLb)
        view.addSubview(subtitleLabel)
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            
            // title
            
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -24),
            titleLabel.leadingAnchor.constraint(equalTo: subtitleLabel.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: subtitleLabel.trailingAnchor),
            
            
            // subtitle
            
            subtitleLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -24),
            subtitleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
            // login
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
//            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
          
//            signInButton.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 16),
//            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
//            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
//            signInButton.heightAnchor.constraint(equalToConstant: 35)
            
            // signin button
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
            // errroMsgLb
            errorMsgLb.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMsgLb.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMsgLb.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor),

        ])
    }
}

extension LoginViewController {
    
    @objc func signInTapped() {
        errorMsgLb.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = userName, let password = password else {
            assertionFailure("username / password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "username/password cannot be blank")
        }
        
        if username == "datta" && password == "Test@123" {
            signInButton.configuration?.showsActivityIndicator = true
        }else{
            configureView(withMessage: "Incorrect username/password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMsgLb.isHidden = false
        errorMsgLb.text = message
    }
}
