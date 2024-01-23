//
//  ConfirmationRegistrationView.swift
//  FinalProject2
//
//  Created by Skorodumov Dmitry on 23.01.2024.
//

import Foundation
import UIKit

class ConfirmationRegistrationView: UIViewController {
    
    var phone : String = "+38-000000000"
    
    private lazy var backButton : UIButton  = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let backImage = UIImage(named: "backArrow")
        button.setImage(backImage, for: UIControl.State())
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var logo: UILabel = {
     
        let label = CustomLabel(title: "Подтверждение регистрации", titleColor: .black, fontName: "Inter-SemiBold", fontSize: 18)
        label.textColor = UIColor(red: 0.965, green: 0.592, blue: 0.027, alpha: 1)
        return label
                            
    }()
    
    private lazy var textLabelNumber: UILabel = {
       
        let label = CustomLabel(title: "Мы отправили SMS с кодом на номер \(phone)", titleColor: UIColor(red: 0.149, green: 0.196, blue: 0.22, alpha: 1), fontName: "Inter-SemiBold", fontSize: 14)
        return label
    }()
    
    
    private lazy var numberField : UITextField = {
        let textField = UITextField()
        
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.149, green: 0.196, blue: 0.22, alpha: 1).cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "___-___-__"
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        
        return textField
    }()
   
    private lazy var registrationButton: UIButton = {
        let buttonLog = CustomButton(title: "ЗАРЕГЕСТРИРОВАТЬСЯ", titleColor: .white, buttonBackgroundColor: UIColor(red: 0.149, green: 0.196, blue: 0.22, alpha: 1)) { [weak self] in
            self?.buttonPressed()
        }
        buttonLog.translatesAutoresizingMaskIntoConstraints = false
        buttonLog.layer.cornerRadius = 10
        return buttonLog
    }()

    private lazy var okImage: UIImageView = {
        
        let image  = UIImage(named: "okImage")
        let avatar =  UIImageView(image: image)
        
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.clipsToBounds = true
        return avatar
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
        view.addSubview(backButton)
        view.addSubview(logo)
        view.addSubview(textLabelNumber)
        view.addSubview(numberField)
        view.addSubview(registrationButton)
        view.addSubview(okImage)
    }

    func setupConstraints() {
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor , constant: 32),
            backButton.widthAnchor.constraint(equalToConstant: 25),
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.heightAnchor.constraint(equalToConstant: 25),
            
            logo.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            logo.widthAnchor.constraint(equalToConstant: 274),
            logo.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 70),
            logo.heightAnchor.constraint(equalToConstant: 22),
            
            textLabelNumber.topAnchor.constraint(equalTo: logo.bottomAnchor , constant: 10),
            textLabelNumber.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            textLabelNumber.widthAnchor.constraint(equalToConstant: 280),
            textLabelNumber.heightAnchor.constraint(equalToConstant: 60),
            
            numberField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            numberField.widthAnchor.constraint(equalToConstant: 290),
            numberField.topAnchor.constraint(equalTo: textLabelNumber.bottomAnchor, constant: 138),
            numberField.heightAnchor.constraint(equalToConstant: 48),
            
            registrationButton.topAnchor.constraint(equalTo: numberField.bottomAnchor , constant: 87),
            registrationButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            registrationButton.widthAnchor.constraint(equalToConstant: 290),
            registrationButton.heightAnchor.constraint(equalToConstant: 48),
            
            okImage.topAnchor.constraint(equalTo: registrationButton.bottomAnchor , constant: 50),
            okImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            okImage.widthAnchor.constraint(equalToConstant: 86),
            okImage.heightAnchor.constraint(equalToConstant: 100)
            
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
