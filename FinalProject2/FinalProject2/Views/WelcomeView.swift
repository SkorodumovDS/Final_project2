//
//  WelcomeView.swift
//  FinalProject2
//
//  Created by Skorodumov Dmitry on 23.01.2024.
//

import Foundation

import UIKit

class WelcomeView: UIViewController {

    private lazy var logo: UIImageView = {
        
        let image  = UIImage(named: "welcomeImage")
        let avatar =  UIImageView(image: image)
        
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.clipsToBounds = true
        return avatar
    }()
    
    private lazy var registationButton: UIButton = {
        let buttonLog = CustomButton(title: "ЗАРЕГЕСТИРОВАТЬСЯ", titleColor: .white, buttonBackgroundColor: UIColor(red: 0.17, green: 0.223, blue: 0.25, alpha: 1)) { [weak self] in
            self?.buttonPressed()
        }
        buttonLog.translatesAutoresizingMaskIntoConstraints = false
        buttonLog.layer.cornerRadius = 10
        return buttonLog
    }()
    
    private lazy var signInButton: UIButton = {
        let buttonLog = CustomButton(title: "Уже есть аккаунт", titleColor: .black, buttonBackgroundColor: .white) { [weak self] in
            self?.buttonPressed()
        }
        buttonLog.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        buttonLog.translatesAutoresizingMaskIntoConstraints = false
        return buttonLog
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupView()
        addSubviews()
        setupConstraints()
        
    }

    func setupView() {
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 39
    }
    
    func addSubviews() {
        view.addSubview(logo)
        view.addSubview(registationButton)
        view.addSubview(signInButton)
    }
    
    func setupConstraints() {
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            logo.widthAnchor.constraint(equalToConstant: 344),
            logo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 138),
            logo.heightAnchor.constraint(equalToConstant: 344),
            
            registationButton.topAnchor.constraint(equalTo: logo.bottomAnchor , constant: 66),
            registationButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            registationButton.widthAnchor.constraint(equalToConstant: 261),
            registationButton.heightAnchor.constraint(equalToConstant: 47),
            
            signInButton.topAnchor.constraint(equalTo: registationButton.bottomAnchor , constant: 35),
            signInButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            signInButton.widthAnchor.constraint(equalToConstant: 118),
            signInButton.heightAnchor.constraint(equalToConstant: 20)
            
        ])
        
        
    }
    
    @objc func buttonPressed() {
        /*
        guard let delegate = loginDelegate else { return }
        
        //let login  = login.text ?? "Skorodumov"
        //let password = password.text ?? "34525543"
        let login  = login.text ?? ""
        let passwordText = password.text?.description ?? ""
        do {
        try delegate.check(typedLogin: login, typedPassword: passwordText)
            coordinator.login = login
            coordinator.showNextScreen()}
        catch AppError.unauthorized {
        
            let alert = UIAlertController(title: "authorization error".localized(), message: "Incorrect login, Try again after".localized() +  String(self.delayCounter) + "seconds".localized(), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Try again".localized(), comment: "Default action"), style: .default, handler: { _ in
                //NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true)
            alert.actions.first?.isEnabled = false
            self.delayCounter = 10
            let timer = Timer.scheduledTimer(timeInterval: 1.0,
                                             target: self,
                                             selector: #selector(authorizeDelay),
                                             userInfo: alert,
                                             repeats: true)
          */
        }
}

