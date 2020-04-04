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
    func login(_ completion: @escaping (Result<Void, Error>) -> Void)
    func logout(_ completion: @escaping (Result<Void, Error>) -> Void)
}

class SettingsCoordinator: Coordinator, Authenticatable {
    
    weak var parentCoordinator: ApplicationCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "person"), tag: 2)
        handleAuthenticationChange()
    }
    
    func handleAuthenticationChange() {
        
        if Database.shared.isLoggedIn {
            let settingsVC = SettingsVC.make()
            settingsVC.coordinator = self
            navigationController.pushViewController(settingsVC, animated: false)
        } else {
            let authenticationVC = AuthenticationVC.make()
            authenticationVC.coordinator = self
            navigationController.setViewControllers([authenticationVC], animated: false)
        }
    }
    
    func gotoProfile() {
        let profileVC = ProfileVC.make()
        profileVC.coordinator = self
        navigationController.pushViewController(profileVC, animated: true)
    }
    
    func login(_ completion: @escaping (Result<Void, Error>) -> Void) {
        parentCoordinator?.login { result in
            completion(result)
        }
    }
    
    func logout(_ completion: @escaping (Result<Void, Error>) -> Void) {
        parentCoordinator?.logout { result in
            completion(result)
        }
    }
    
}
