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

class LoginCoordinator: Coordinator, AuthenticationDelegate {
    
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
    
    func authenticationDidChange() {
        childCoordinators.removeAll()
        navigationController.popViewController(animated: true)
    }
    
    func login(_ completion: @escaping (Result<Void, Error>) -> Void) {
        authenticationDelegate?.login { result in
            completion(result)
        }
    }
    
    func logout(_ completion: @escaping (Result<Void, Error>) -> Void) {
        authenticationDelegate?.logout { result in
            completion(result)
        }
    }
    
}
