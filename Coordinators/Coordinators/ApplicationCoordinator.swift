//
//  ApplicationCoordinator.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/3/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    
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
    }
    
    func handleAuthenticationChange() {
        childCoordinators.forEach {
            if let coordinator = $0 as? Authenticatable {
                coordinator.handleAuthenticationChange()
            }
        }
    }
    
    func login(_ completion: @escaping (Result<Void, Error>) -> Void) {
        Database.shared.login { [weak self] result in
            if case .success = result {
                self?.handleAuthenticationChange()
            }
            
            completion(result)
        }
    }
    
    func logout(_ completion: @escaping (Result<Void, Error>) -> Void) {
        Database.shared.logout { [weak self] result in
            if case .success = result {
                self?.handleAuthenticationChange()
            }
            
            completion(result)
        }
    }
    
}
