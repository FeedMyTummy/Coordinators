//
//  ApplicationCoordinator.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/3/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator, Authenticatable {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        let restaurantsCoordinator = RestaurantsCoordinator(navigationController: UINavigationController())
        
        let exploreCoordinator = ExploreCoordinator(navigationController: UINavigationController())
        exploreCoordinator.parentCoordinator = self
        
        let settingsCoordinator = SettingsCoordinator(navigationController: UINavigationController())
        settingsCoordinator.parentCoordinator = self
                
        childCoordinators = [
            restaurantsCoordinator,
            exploreCoordinator,
            settingsCoordinator
        ]
    }
    
    func start() {
        childCoordinators.forEach { $0.start() }
        handleAuthenticationChange()
    }
    
    func handleAuthenticationChange() {
        childCoordinators.forEach {
            if let coordinator = $0 as? Authenticatable {
                coordinator.handleAuthenticationChange()
            }
        }
    }
    
    func login() {
        Database.shared.login()
        handleAuthenticationChange()
    }
    
    func logout() {
        Database.shared.logout()
        handleAuthenticationChange()
    }
    
}
