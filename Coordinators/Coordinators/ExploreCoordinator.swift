//
//  MainCoordinator.swift
//  Coordinators
//
//  Created by Nicolas Silva on 3/31/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ExploreCoordinator: Coordinator {
    
    weak var authenticationDelegate: AuthenticationDelegate?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.tabBarItem = UITabBarItem(title: "Explore", image: UIImage(systemName: "map"), tag: 2)
        authenticationDidChange()
    }
    
}

extension ExploreCoordinator: AuthenticationDelegate {
    
    func authenticationDidChange() {
        childCoordinators = []
        navigationController.viewControllers = []
        if Database.shared.isLoggedIn {
            let exploreVC = ExploreVC.make(coordinator: self)
            navigationController.setViewControllers([exploreVC], animated: false)
        } else {
            let authenticationCoordinator = AuthenticationCoordinator(navigationController: navigationController)
            authenticationCoordinator.authenticationDelegate = authenticationDelegate
            childCoordinators.append(authenticationCoordinator)
            authenticationCoordinator.start()
        }
    }
    
}
