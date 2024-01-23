//
//  LoginCoreDataModel.swift
//  FinalProject2
//
//  Created by Skorodumov Dmitry on 23.01.2024.
//

import Foundation
import CoreData

public struct LoginCoreDataModel  {
    
    let phone : String
    let username : ProfileCoreDataModel
    
    init(phone: String, username: ProfileCoreDataModel) {
        self.phone = phone
        self.username = username
    }
}

public extension LoginCoreDataModel {
    
    static func makeEmptyProfile(phone: String) -> LoginCoreDataModel {
        return CoreDataSevice().makeEmptyProfile(phone: phone)
    }
    
    static func search(profile: LoginCoreDataModel) -> LoginCoreDataModel {
        return CoreDataSevice().search(loginModel: profile)
    }
    
}
