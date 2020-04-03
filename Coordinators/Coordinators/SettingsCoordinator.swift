//
//  SettingsCoordinator.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/2/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

protocol Authenticatable: class {
    func handleAuthenticationChange()
    func login()
    func logout()
}

class SettingsCoordinator: Coordinator, Authenticatable {
    
    weak var parentCoordinator: ApplicationCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        handleAuthenticationChange()
    }
    
    func handleAuthenticationChange() {
        navigationController.setNavigationBarHidden(true, animated: false)
        
        let destinationVC: UIViewController
        
        if Database.shared.isLoggedIn {
            let settingsVC = SettingsVC.make()
            settingsVC.coordinator = self
            destinationVC = settingsVC
        } else {
            let authenticationVC = AuthenticationVC.make()
            authenticationVC.coordinator = self
            destinationVC = authenticationVC
        }
        
        destinationVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        navigationController.setViewControllers([destinationVC], animated: false)
    }
    
    func login() {
        parentCoordinator?.login()
    }
    
    func logout() {
        parentCoordinator?.logout()
    }
    
}
