//
//  MainCoordinator.swift
//  Coordinators
//
//  Created by Nicolas Silva on 3/31/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ExploreCoordinator: AuthenticationObserver, Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    private let databaseService: DatabaseService
    
    init(navigationController: UINavigationController, databaseService: DatabaseService) {
        self.navigationController = navigationController
        self.databaseService = databaseService
    }
    
    func start() {
        navigationController.tabBarItem = UITabBarItem(title: "Explore", image: UIImage(systemName: "map"), tag: 2)
        authenticationDidChange(status: databaseService.loginStatus)
    }
    
    override func authenticationDidChange(status: AuthenticationStatus) {
        childCoordinators = []
        navigationController.viewControllers = []
        
        switch status {
        case .loggedIn:
            let exploreVC = ExploreVC.make(coordinator: self)
            navigationController.setViewControllers([exploreVC], animated: false)
        case .loggedOut:
            let authenticationCoordinator = AuthenticationCoordinator(navigationController: navigationController, databaseService: databaseService)
            childCoordinators.append(authenticationCoordinator)
            authenticationCoordinator.start()
        }
    }
    
}
