//
//  MainCoordinator.swift
//  Coordinators
//
//  Created by Nicolas Silva on 3/31/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ExploreCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        addAuthenticationDelegateObserver(self)
    }
    
    deinit {
        removeAuthenticationDelegateObserver(self)
    }
    
    func start() {
        navigationController.tabBarItem = UITabBarItem(title: "Explore", image: UIImage(systemName: "map"), tag: 2)
        authenticationDidChange()
    }
    
}

extension ExploreCoordinator: AuthenticationDelegate {
    
    @objc func authenticationDidChange() {
        childCoordinators = []
        navigationController.viewControllers = []
        if Database.shared.isLoggedIn {
            let exploreVC = ExploreVC.make(coordinator: self)
            navigationController.setViewControllers([exploreVC], animated: false)
        } else {
            let authenticationCoordinator = AuthenticationCoordinator(navigationController: navigationController)
            childCoordinators.append(authenticationCoordinator)
            authenticationCoordinator.start()
        }
    }
    
}
