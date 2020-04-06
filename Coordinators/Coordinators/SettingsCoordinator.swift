//
//  SettingsCoordinator.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/2/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SettingsCoordinator: AuthenticationObserver, Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func authenticationDidChange() {
        childCoordinators = []
        navigationController.viewControllers = []
        
        if Database.shared.isLoggedIn {
            let settingsVC = SettingsVC.make(coordinator: self)
            navigationController.pushViewController(settingsVC, animated: false)
        } else {
            let authenticationCoordinator = AuthenticationCoordinator(navigationController: navigationController)
            childCoordinators.append(authenticationCoordinator)
            authenticationCoordinator.start()
        }
    }
    
    func start() {
        navigationController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "person"), tag: 2)
        authenticationDidChange()
    }
    
    func gotoProfile() {
        let profileVC = ProfileVC.make(coordinator: self)
        navigationController.pushViewController(profileVC, animated: true)
    }
    
    func login(_ completion: @escaping (Result<Void, Error>) -> Void) {
        Database.shared.login {
            completion($0)
        }
    }
    
    func logout(_ completion: @escaping (Result<Void, Error>) -> Void) {
        Database.shared.logout {
            if case .success = $0 {
                NotificationCenter.default.post(name: .AuthenticationDidChange, object: nil)
            }
            completion($0)
        }
    }
    
}
