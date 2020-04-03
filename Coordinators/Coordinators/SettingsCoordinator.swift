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
        
        destinationVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "person"), tag: 2)
        navigationController.setViewControllers([destinationVC], animated: false)
    }
    
    func login(_ completion: @escaping (Result<Void, Error>) -> Void) {
        parentCoordinator?.login { [weak self] result in
            if case .success = result {
                self?.handleAuthenticationChange()
            }
            completion(result)
        }
    }
    
    func logout(_ completion: @escaping (Result<Void, Error>) -> Void) {
        parentCoordinator?.logout { [weak self] result in
            self?.handleAuthenticationChange()
            completion(result)
        }
    }
    
}
