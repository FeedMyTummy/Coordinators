//
//  MainCoordinator.swift
//  Coordinators
//
//  Created by Nicolas Silva on 3/31/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ExploreCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let exploreVC = ExploreVC.make()
        exploreVC.coordinator = self
        exploreVC.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 1)
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(exploreVC, animated: false)
    }
    
}
