//
//  MainTabBarController.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/1/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private var coordinator = ApplicationCoordinator(navigationController: UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coordinator.start()
        viewControllers = coordinator.childCoordinators.map { $0.navigationController }
    }
    
    
}
