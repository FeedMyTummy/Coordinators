//
//  AuthenticationCoordinator.swift
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
    
    weak var authenticationDelegate: AuthenticationDelegate?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let authenticationVC = AuthenticationVC.make(coordinator: self)
        navigationController.pushViewController(authenticationVC, animated: false)
    }
    
    func login(_ completion: @escaping (Result<Void, Error>) -> Void) {
        Database.shared.login { [weak self] result in
            if case .success = result {
                self?.authenticationDelegate?.authenticationDidChange()
            }
            completion(result)
        }
    }
    
    func logout(_ completion: @escaping (Result<Void, Error>) -> Void) {
        Database.shared.logout { [weak self] result in
            if case .success = result {
                self?.authenticationDelegate?.authenticationDidChange()
            }
            completion(result)
        }
    }
    
}
