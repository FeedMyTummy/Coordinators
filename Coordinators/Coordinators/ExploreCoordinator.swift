//
//  MainCoordinator.swift
//  Coordinators
//
//  Created by Nicolas Silva on 3/31/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ExploreCoordinator: Coordinator {
    
    weak var parentCoordinator: ApplicationCoordinator?
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
        if Database.shared.isLoggedIn {
            let exploreVC = ExploreVC.make()
            exploreVC.coordinator = self
            navigationController.setViewControllers([exploreVC], animated: false)
        } else {
            let loginCoordinator = LoginCoordinator(navigationController: navigationController)
            childCoordinators.append(loginCoordinator)
            loginCoordinator.start()
        }
    }
    
}
