//
//  AuthenticationCoordinator.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/4/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class AuthenticationCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    let databaseService: DatabaseService
    
    init(navigationController: UINavigationController, databaseService: DatabaseService) {
        self.navigationController = navigationController
        self.databaseService = databaseService
    }
    
    func start() {
        let authenticationVC = AuthenticationVC.make(coordinator: self)
        navigationController.pushViewController(authenticationVC, animated: false)
    }
    
    func login(_ completion: @escaping (Result<Void, Error>) -> Void) {
        databaseService.login {  result in
            if case .success = result {
                NotificationCenter.default.post(name: .AuthenticationDidLogin, object: nil)
            }
            completion(result)
        }
    }
    
    func logout(_ completion: @escaping (Result<Void, Error>) -> Void) {
        databaseService.logout { result in
            if case .success = result {
                NotificationCenter.default.post(name: .AuthenticationDidLoggout, object: nil)
            }
            completion(result)
        }
    }
    
}
