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
        
        let restaurantsCoordinator = RestaurantsCoordinator(navigationController: UINavigationController())
        
        let exploreCoordinator = ExploreCoordinator(navigationController: UINavigationController())
        exploreCoordinator.applicationController = self
        
        let settingsCoordinator = SettingsCoordinator(navigationController: UINavigationController())
        settingsCoordinator.applicationController = self
                
        childCoordinators = [
            restaurantsCoordinator,
            exploreCoordinator,
            settingsCoordinator
        ]
        
        tabController.viewControllers = childCoordinators.map { $0.navigationController }
        tabController.delegate = self
    }
    
    func start() {
        childCoordinators.forEach { $0.start() }
    }
    
    func login(_ completion: @escaping (Result<Void, Error>) -> Void) {
//        Database.shared.login { [weak self] result in
//            if case .success = result {
//                self?.handleAuthenticationChange()
//            }
//            completion(result)
//        }
    }
    
    func logout(_ completion: @escaping (Result<Void, Error>) -> Void) {
//        Database.shared.logout { [weak self] result in
//            if case .success = result {
//                self?.handleAuthenticationChange()
//            }
//            completion(result)
//        }
    }
    
}

extension ApplicationController: AuthenticationDelegate {
    
    func authenticationDidChange() {
        childCoordinators.forEach {
            if let coordinator = $0 as? AuthenticationDelegate {
                coordinator.authenticationDidChange()
            }
        }
    }
    
}

extension ApplicationController: UITabBarControllerDelegate {
    
}
