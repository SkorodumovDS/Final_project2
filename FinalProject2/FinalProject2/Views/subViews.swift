//
//  subViews.swift
//  FinalProject2
//
//  Created by Skorodumov Dmitry on 23.01.2024.
//

import UIKit

class CustomButton: UIButton {
    
    var action: (() -> Void)?
    
    init(title : String , titleColor : UIColor , buttonBackgroundColor : UIColor, action: @escaping (() -> Void)) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = buttonBackgroundColor
        addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        self.action = action
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonPressed(){
            action?()
    }
}

class CustomLabel: UILabel {
    
    
    init(title : String , titleColor : UIColor , fontName : String , fontSize: CGFloat) {
        super.init(frame: .zero)
       
        text = title
        font = UIFont(name: fontName, size: fontSize)
        translatesAutoresizingMaskIntoConstraints = false
        textColor = titleColor
        textAlignment = .center
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
