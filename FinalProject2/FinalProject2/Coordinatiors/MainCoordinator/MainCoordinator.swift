//
//  mainCoordinator.swift
//  FinalProject2
//
//  Created by Skorodumov Dmitry on 23.01.2024.
//

import UIKit

protocol MainCoordinator {
    func startApplication() -> UIViewController
}

final class MainCoordinatorImp : MainCoordinator {
    func startApplication() -> UIViewController {
        return WelcomeBackView()
    }
}
