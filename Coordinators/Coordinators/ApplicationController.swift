//
//  ApplicationController.swift
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
    let databaseService: DatabaseService = Database.shared
    
    override init() {
        tabController = UITabBarController()
        
        super.init()
        
        let restaurantsCoordinator = RestaurantsCoordinator(navigationController: UINavigationController(), databaseService: databaseService)
        
        let exploreCoordinator = ExploreCoordinator(navigationController: UINavigationController(), databaseService: databaseService)
        
        let settingsCoordinator = SettingsCoordinator(navigationController: UINavigationController(), databaseService: databaseService)
                
        childCoordinators = [
            restaurantsCoordinator,
            exploreCoordinator,
            settingsCoordinator
        ]
        
        tabController.viewControllers = childCoordinators.map { $0.navigationController }
        tabController.delegate = self
        childCoordinators.forEach { $0.start() }
    }
    
}

extension ApplicationController: UITabBarControllerDelegate {
    
}
