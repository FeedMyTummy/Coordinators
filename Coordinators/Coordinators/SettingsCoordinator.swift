//
//  SettingsCoordinator.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/2/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SettingsCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if Database.shared.isLoggedIn {
            let settingsVC = SettingsVC.make()
            settingsVC.coordinator = self
            settingsVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
            navigationController.setNavigationBarHidden(true, animated: false)
            navigationController.pushViewController(settingsVC, animated: true)
        } else {
            let authenticationVC = AuthenticationVC.make()
            authenticationVC.coordinator = self
            authenticationVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)

            navigationController.setNavigationBarHidden(true, animated: false)
            navigationController.pushViewController(authenticationVC, animated: true)
        }
    }
    
}
