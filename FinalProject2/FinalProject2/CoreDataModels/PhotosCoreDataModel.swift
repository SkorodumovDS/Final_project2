//
//  PhotosCoreDataModel.swift
//  FinalProject2
//
//  Created by Skorodumov Dmitry on 23.01.2024.
//

import Foundation
import CoreData

public struct PhotosCoreDataModel  {
    
    let title : String
 
    init(title: String) {
        self.title = title
    }
}

public extension PhotosCoreDataModel {
    
    static func make() -> [PhotosCoreDataModel] {
        return CoreDataSevice().fetchPhotos()
    }
    
}

