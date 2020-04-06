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

extension AuthenticationDelegate where Self: Coordinator {
    func authenticationDidChange() {
        childCoordinators = []
        dismiss(animated: false)
        present(animated: false, onDismissed: nil)
    }
}

class AuthenticationCoordinator: Coordinator {
    
    var router: Router
    weak var authenticationDelegate: AuthenticationDelegate?
    var childCoordinators = [Coordinator]()
    
    func present(animated: Bool, onDismissed: (() -> Void)?) {
        let authenticationVC = AuthenticationVC.make(coordinator: self)
        router.present(authenticationVC, animated: false)
    }
    
    init(router: Router) {
        self.router = router
        print("AuthenticationCoordinator: init")
    }
    
    deinit {
        print("AuthenticationCoordinator: deinit")
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
