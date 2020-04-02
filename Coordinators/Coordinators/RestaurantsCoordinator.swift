//
//  RestaurantsCoordinator.swift
//  Coordinators
//
//  Created by Nicolas Silva on 3/31/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class RestaurantsCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let restaurantsVC = RestaurantsVC.make()
        restaurantsVC.coordinator = self
        restaurantsVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(restaurantsVC, animated: true)
    }
    
}
