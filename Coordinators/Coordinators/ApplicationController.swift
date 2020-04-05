//
//  ApplicationCoordinator.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/3/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ApplicationController: NSObject {
    
    var childCoordinators = [Coordinator]()
    let tabController: UITabBarController
    var rootViewController: UIViewController { tabController }
    
    override init() {
        tabController = UITabBarController()
        
        super.init()
        
        
        authenticationDidChange()
        tabController.delegate = self
    }
    
}

extension ApplicationController: AuthenticationDelegate {
    
    func authenticationDidChange() {
        let restaurantsCoordinator = RestaurantsCoordinator(navigationController: UINavigationController())
        restaurantsCoordinator.start()
        
        if Database.shared.isLoggedIn {
            let exploreCoordinator = ExploreCoordinator(navigationController: UINavigationController())
            
            exploreCoordinator.authenticationDelegate = self
            exploreCoordinator.start()
            
            let settingsCoordinator = SettingsCoordinator(navigationController: UINavigationController())
            
            settingsCoordinator.authenticationDelegate = self
            settingsCoordinator.start()
            
            childCoordinators = [
                restaurantsCoordinator,
                exploreCoordinator,
                settingsCoordinator
            ]
        } else {
            let authenticationCoordinator = AuthenticationCoordinator(navigationController: UINavigationController())
            childCoordinators.append(authenticationCoordinator)
            authenticationCoordinator.authenticationDelegate = self
            authenticationCoordinator.start()
            
            childCoordinators = [
                restaurantsCoordinator,
                authenticationCoordinator,
                authenticationCoordinator
            ]
        }
        
        tabController.viewControllers = childCoordinators.map { $0.navigationController }
    }
    
}

extension ApplicationController: UITabBarControllerDelegate {
    
}
