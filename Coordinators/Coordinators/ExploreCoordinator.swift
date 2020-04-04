//
//  MainCoordinator.swift
//  Coordinators
//
//  Created by Nicolas Silva on 3/31/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ExploreCoordinator: Coordinator, Authenticatable {
    
    weak var parentCoordinator: ApplicationCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.tabBarItem = UITabBarItem(title: "Explore", image: UIImage(systemName: "map"), tag: 2)
        handleAuthenticationChange()
    }
    
    func handleAuthenticationChange() {
        
        let destinationVC: UIViewController
        
        if Database.shared.isLoggedIn {
            let exploreVC = ExploreVC.make()
            exploreVC.coordinator = self
            destinationVC = exploreVC
        } else {
            let authenticationVC = AuthenticationVC.make()
            authenticationVC.coordinator = self
            destinationVC = authenticationVC
        }
        
        navigationController.setViewControllers([destinationVC], animated: false)
    }
    
    func login(_ completion: @escaping (Result<Void, Error>) -> Void) {
        parentCoordinator?.login { result in
            completion(result)
        }
    }
    
    func logout(_ completion: @escaping (Result<Void, Error>) -> Void) {
        parentCoordinator?.logout { result in
            completion(result)
        }
    }
    
}
