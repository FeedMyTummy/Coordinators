//
//  LoginCoordinator.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/4/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

protocol AuthenticationDelegate: class {
    func authenticationDidChange()
}

class AuthenticationCoordinator: Coordinator {
    
    weak var authenticationDelegate: SettingsCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let authenticationVC = AuthenticationVC.make()
        authenticationVC.coordinator = self
        navigationController.pushViewController(authenticationVC, animated: false)
    }
    
    func login(_ completion: @escaping (Result<Void, Error>) -> Void) {
        authenticationDelegate?.login {
            completion($0)
        }
    }
    
    func logout(_ completion: @escaping (Result<Void, Error>) -> Void) {
        authenticationDelegate?.logout {
            completion($0)
        }
    }
    
}
