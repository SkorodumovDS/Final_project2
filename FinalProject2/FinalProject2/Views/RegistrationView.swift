//
//  RegistrationView.swift
//  FinalProject2
//
//  Created by Skorodumov Dmitry on 23.01.2024.
//

import Foundation

import UIKit

class RegistrationView: UIViewController {

    private lazy var backButton : UIButton  = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let backImage = UIImage(named: "backArrow")
        button.setImage(backImage, for: UIControl.State())
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var logo: UILabel = {
     
        let label = CustomLabel(title: "ЗАРЕГЕСТРИРОВАТЬСЯ", titleColor: .black, fontName: "Inter-SemiBold", fontSize: 18)
        return label
                            
    }()
    
    private lazy var textLabelNumber: UILabel = {
       
        let label = CustomLabel(title: "Введите номер", titleColor: UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1), fontName: "Inter-SemiBold", fontSize: 16)
        return label
    }()
    
    private lazy var textLabelNumberUsage: UILabel = {
        let label = CustomLabel(title: "Ваш номер будет использоваться для входа в аккаунт", titleColor: UIColor(red: 0.495, green: 0.507, blue: 0.512, alpha: 1), fontName: "Inter-SemiBold", fontSize: 8)
 
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
   
    private lazy var nextButton: UIButton = {
        let buttonLog = CustomButton(title: "ДАЛЕЕ", titleColor: .white, buttonBackgroundColor: UIColor(red: 0.149, green: 0.196, blue: 0.22, alpha: 1)) { [weak self] in
            self?.buttonPressed()
        }
        buttonLog.translatesAutoresizingMaskIntoConstraints = false
        buttonLog.layer.cornerRadius = 10
        return buttonLog
    }()

    private lazy var textLabelAgreement: UILabel = {
        let label = CustomLabel(title: "Нажимая кнопку 'Далее' Вы принимаете пользовательское Соглашение и политику конфиденциальности", titleColor: UIColor(red: 0.495, green: 0.507, blue: 0.512, alpha: 1), fontName: "Inter-Medium", fontSize: 8)
 
        return label
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
        view.addSubview(textLabelNumberUsage)
        view.addSubview(numberField)
        view.addSubview(nextButton)
        view.addSubview(textLabelAgreement)
    }
    
    func setupConstraints() {
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor , constant: 32),
            backButton.widthAnchor.constraint(equalToConstant: 25),
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.heightAnchor.constraint(equalToConstant: 25),
            
            logo.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            logo.widthAnchor.constraint(equalToConstant: 223),
            logo.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 60),
            logo.heightAnchor.constraint(equalToConstant: 22),
            
            textLabelNumber.topAnchor.constraint(equalTo: logo.bottomAnchor , constant: 70),
            textLabelNumber.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            textLabelNumber.widthAnchor.constraint(equalToConstant: 123),
            textLabelNumber.heightAnchor.constraint(equalToConstant: 24),
            
            textLabelNumberUsage.topAnchor.constraint(equalTo: textLabelNumber.bottomAnchor , constant: 5),
            textLabelNumberUsage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            textLabelNumberUsage.widthAnchor.constraint(equalToConstant: 270),
            textLabelNumberUsage.heightAnchor.constraint(equalToConstant: 50),
            
            numberField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            numberField.widthAnchor.constraint(equalToConstant: 290),
            numberField.topAnchor.constraint(equalTo: textLabelNumberUsage.bottomAnchor, constant: 33),
            numberField.heightAnchor.constraint(equalToConstant: 48),
            
            nextButton.topAnchor.constraint(equalTo: numberField.bottomAnchor , constant: 63),
            nextButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 120),
            nextButton.heightAnchor.constraint(equalToConstant: 47),
            
            textLabelAgreement.topAnchor.constraint(equalTo: nextButton.bottomAnchor , constant: 30),
            textLabelAgreement.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            textLabelAgreement.widthAnchor.constraint(equalToConstant: 290),
            textLabelAgreement.heightAnchor.constraint(equalToConstant: 85)
            
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
