//
//  WelcomeBackView.swift
//  FinalProject2
//
//  Created by Skorodumov Dmitry on 23.01.2024.
//

import Foundation
import UIKit

class WelcomeBackView: UIViewController {
    
    private lazy var logo: UILabel = {
     
        let label = CustomLabel(title: "С возварщением", titleColor: .black, fontName: "Inter-Bold", fontSize: 18)
        label.textColor = UIColor(red: 0.965, green: 0.592, blue: 0.027, alpha: 1)
        return label
                            
    }()
    
    private lazy var textLabelNumber: UILabel = {
       
        let label = CustomLabel(title: "Введите номер телефона для входа в приложение", titleColor: UIColor(red: 0.149, green: 0.196, blue: 0.22, alpha: 1), fontName: "Inter-SemiBold", fontSize: 14)
        return label
    }()
    
    
    private lazy var numberField : UITextField = {
        let textField = UITextField()
        
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.149, green: 0.196, blue: 0.22, alpha: 1).cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "+38___-___-__"
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        
        return textField
    }()
   
    private lazy var signInButton: UIButton = {
        let buttonLog = CustomButton(title: "ПОДТВЕРДИТЬ", titleColor: .white, buttonBackgroundColor: UIColor(red: 0.149, green: 0.196, blue: 0.22, alpha: 1)) { [weak self] in
            self?.buttonPressed()
        }
        buttonLog.translatesAutoresizingMaskIntoConstraints = false
        buttonLog.layer.cornerRadius = 10
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
        view.addSubview(textLabelNumber)
        view.addSubview(numberField)
        view.addSubview(signInButton)
    }

    func setupConstraints() {
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            logo.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            logo.widthAnchor.constraint(equalToConstant: 156),
            logo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 194),
            logo.heightAnchor.constraint(equalToConstant: 22),
            
            textLabelNumber.topAnchor.constraint(equalTo: logo.bottomAnchor , constant: 26),
            textLabelNumber.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            textLabelNumber.widthAnchor.constraint(equalToConstant: 280),
            textLabelNumber.heightAnchor.constraint(equalToConstant: 60),
            
            numberField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            numberField.widthAnchor.constraint(equalToConstant: 290),
            numberField.topAnchor.constraint(equalTo: textLabelNumber.bottomAnchor, constant: 12),
            numberField.heightAnchor.constraint(equalToConstant: 48),
            
            signInButton.topAnchor.constraint(equalTo: numberField.bottomAnchor , constant: 148),
            signInButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            signInButton.widthAnchor.constraint(equalToConstant: 188),
            signInButton.heightAnchor.constraint(equalToConstant: 48)
            
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
