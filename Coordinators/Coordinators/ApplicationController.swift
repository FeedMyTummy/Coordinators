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
        
        let restaurantsNavigationController = UINavigationController()
        restaurantsNavigationController.tabBarItem = UITabBarItem(title: "Restaurants", image: UIImage(systemName: "list.dash"), tag: 0)
        
        let exploreNavigationController = UINavigationController()
        exploreNavigationController.tabBarItem = UITabBarItem(title: "Explore", image: UIImage(systemName: "map"), tag: 1)
        
        let settingsNavigationController = UINavigationController()
        settingsNavigationController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "person"), tag: 2)
        
        let restaurantsCoordinator = RestaurantsCoordinator(router: NavigationRouter(navigationController: restaurantsNavigationController))
        
        let exploreCoordinator = ExploreCoordinator(router: NavigationRouter(navigationController: exploreNavigationController))
        exploreCoordinator.authenticationDelegate = self
        
        let settingsCoordinator = SettingsCoordinator(router: NavigationRouter(navigationController: settingsNavigationController))
        settingsCoordinator.authenticationDelegate = self
                
        
        childCoordinators = [
            restaurantsCoordinator,
            exploreCoordinator,
            settingsCoordinator
        ]
        
        
        tabController.viewControllers = [
            restaurantsNavigationController,
            exploreNavigationController,
            settingsNavigationController
        ]
        
        
        tabController.delegate = self
        childCoordinators.forEach { $0.present(animated: false, onDismissed: nil) }
        print("ApplicationController: init")
    }
    
    deinit {
        print("ApplicationController: deinit")
    }
    
}

extension ApplicationController: AuthenticationDelegate {
    
    func authenticationDidChange() {
        for case let coordinator as AuthenticationDelegate in childCoordinators {
            coordinator.authenticationDidChange()
        }
    }
    
}

extension ApplicationController: UITabBarControllerDelegate {
    
}
