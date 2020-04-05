//
//  SettingsCoordinator.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/2/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SettingsCoordinator: Coordinator {
    
    weak var authenticationDelegate: AuthenticationDelegate?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let settingsVC = SettingsVC.make(coordinator: self)
        navigationController.pushViewController(settingsVC, animated: false)
//        authenticationDidChange()
    }
    
    func gotoProfile() {
        let profileVC = ProfileVC.make(coordinator: self)
        navigationController.pushViewController(profileVC, animated: true)
    }
    
    func login(_ completion: @escaping (Result<Void, Error>) -> Void) {
        Database.shared.login { [weak self] in
            if case .success = $0 {
                self?.authenticationDelegate?.authenticationDidChange()
            }
            completion($0)
        }
    }
    
    func logout(_ completion: @escaping (Result<Void, Error>) -> Void) {
        Database.shared.logout { [weak self] in
            if case .success = $0 {
                self?.authenticationDelegate?.authenticationDidChange()
            }
            completion($0)
        }
    }
    
}

//extension SettingsCoordinator: AuthenticationDelegate {
//
//    func authenticationDidChange() {
//        childCoordinators = []
//        navigationController.viewControllers = []
//
//        if Database.shared.isLoggedIn {
//            let settingsVC = SettingsVC.make(coordinator: self)
//            navigationController.pushViewController(settingsVC, animated: false)
//        } else {
//            let authenticationCoordinator = AuthenticationCoordinator(navigationController: navigationController)
//            childCoordinators.append(authenticationCoordinator)
//            authenticationCoordinator.authenticationDelegate = authenticationDelegate
//            authenticationCoordinator.start()
//        }
//    }
//
//}
