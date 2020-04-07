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
    private let databaseService: DatabaseService
    
    init(navigationController: UINavigationController, databaseService: DatabaseService) {
        self.navigationController = navigationController
        self.databaseService = databaseService
    }
    
    override func authenticationDidChange(status: AuthenticationStatus) {
        childCoordinators = []
        navigationController.viewControllers = []
        
        switch status {
        case .loggedIn:
            let settingsVC = SettingsVC.make(coordinator: self)
            navigationController.pushViewController(settingsVC, animated: false)
        case .loggedOut:
            let authenticationCoordinator = AuthenticationCoordinator(navigationController: navigationController, databaseService: databaseService)
            childCoordinators.append(authenticationCoordinator)
            authenticationCoordinator.start()
        }
    }
    
    func start() {
        navigationController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "person"), tag: 2)
        authenticationDidChange(status: databaseService.loginStatus)
    }
    
    func gotoProfile() {
        let profileVC = ProfileVC.make(coordinator: self)
        navigationController.pushViewController(profileVC, animated: true)
    }
    
    func login(_ completion: @escaping (Result<Void, Error>) -> Void) {
        databaseService.login {
            completion($0)
        }
    }
    
    func logout(_ completion: @escaping (Result<Void, Error>) -> Void) {
        databaseService.logout {
            if case .success = $0 {
                NotificationCenter.default.post(name: .AuthenticationDidLoggout, object: nil)
            }
            completion($0)
        }
    }
    
}
