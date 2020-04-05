//
//  MainCoordinator.swift
//  Coordinators
//
//  Created by Nicolas Silva on 3/31/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ExploreCoordinator: Coordinator {
    
    var router: Router
    weak var authenticationDelegate: AuthenticationDelegate?
    var childCoordinators = [Coordinator]()
    
    init(router: Router) {
        self.router = router
        print("ExploreCoordinator: init")
    }
    
    func present(animated: Bool, onDismissed: (() -> Void)?) {
        childCoordinators = []
        if Database.shared.isLoggedIn {
            let exploreVC = ExploreVC.make(coordinator: self)
            router.present(exploreVC, animated: animated)
        } else {
            let authenticationCoordinator = AuthenticationCoordinator(router: router)
            authenticationCoordinator.authenticationDelegate = authenticationDelegate
            presentChild(authenticationCoordinator, animated: animated)
        }
    }
    
    deinit {
        print("ExploreCoordinator: deinit")
    }
    
}
