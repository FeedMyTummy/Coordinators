//
//  MainTabBarController.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/1/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let restaurants = RestaurantsCoordinator(navigationController: UINavigationController())
    let exploreCoordinator = ExploreCoordinator(navigationController: UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        restaurants.start()
        exploreCoordinator.start()
        viewControllers = [restaurants.navigationController,
                           exploreCoordinator.navigationController]
    }
    
}
