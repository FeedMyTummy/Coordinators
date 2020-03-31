//
//  MainCoordinator.swift
//  Coordinators
//
//  Created by Nicolas Silva on 3/31/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainVC = ViewController.make()
        
        mainVC.coordinator = self
        navigationController.setNavigationBarHidden(true, animated: false)
        
        navigationController.pushViewController(mainVC, animated: false)
    }
    
    func gotoRestaurantVC() {
        let restaurantsVC = RestaurantsVC.make()
        restaurantsVC.coordinator = self
        
        navigationController.setNavigationBarHidden(false, animated: true)
        navigationController.pushViewController(restaurantsVC, animated: true)
    }
}
