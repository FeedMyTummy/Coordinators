//
//  MainTabBarController.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/1/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private var coordinators = [Coordinator]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coordinators = [
            RestaurantsCoordinator(navigationController: UINavigationController()),
            ExploreCoordinator(navigationController: UINavigationController()),
            SettingsCoordinator(navigationController: UINavigationController())
        ]
        
        coordinators.forEach { $0.start() }
        
        viewControllers = coordinators.map { $0.navigationController }
        
        delegate = self
    }
    
    
}

extension MainTabBarController: UITabBarControllerDelegate {
    
        func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            if let index = tabBarController.viewControllers?.firstIndex(of: viewController) {
                coordinators[index].start()
            }
            
            return true
        }
    
}
