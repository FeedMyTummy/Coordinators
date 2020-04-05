//
//  SettingsCoordinator.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/2/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SettingsCoordinator: Coordinator {
    
    var router: Router
    weak var authenticationDelegate: AuthenticationDelegate?
    var childCoordinators = [Coordinator]()
    
    init(router: Router) {
        self.router = router
        print("SettingsCoordinator: init")
    }
    
    func present(animated: Bool, onDismissed: (() -> Void)?) {
        childCoordinators = []
        
        if Database.shared.isLoggedIn {
            let settingsVC = SettingsVC.make(coordinator: self)
            router.present(settingsVC, animated: false)
        } else {
            let authenticationCoordinator = AuthenticationCoordinator(router: router)
            authenticationCoordinator.authenticationDelegate = authenticationDelegate
            presentChild(authenticationCoordinator, animated: animated)
        }
    }
    
    deinit {
        print("SettingsCoordinator: deinit")
    }
    
    func gotoProfile() {
        let profileVC = ProfileVC.make(coordinator: self)
        router.present(profileVC, animated: true)
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
