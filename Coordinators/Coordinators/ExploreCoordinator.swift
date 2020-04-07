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
    private let databaseSource: DatabaseService
    
    init(navigationController: UINavigationController, databaseSource: DatabaseService) {
        self.navigationController = navigationController
        self.databaseSource = databaseSource
    }
    
    func start() {
        navigationController.tabBarItem = UITabBarItem(title: "Explore", image: UIImage(systemName: "map"), tag: 2)
        authenticationDidChange(status: databaseSource.loginStatus)
    }
    
    override func authenticationDidChange(status: AuthenticationStatus) {
        childCoordinators = []
        navigationController.viewControllers = []
        
        switch status {
        case .loggedIn:
            let exploreVC = ExploreVC.make(coordinator: self)
            navigationController.setViewControllers([exploreVC], animated: false)
        case .loggedOut:
            let authenticationCoordinator = AuthenticationCoordinator(navigationController: navigationController, databaseSource: databaseSource)
            childCoordinators.append(authenticationCoordinator)
            authenticationCoordinator.start()
        }
    }
    
}
