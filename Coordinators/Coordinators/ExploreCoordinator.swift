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
        handleAuthenticationChange()
    }
    
    func handleAuthenticationChange() {
        navigationController.setNavigationBarHidden(true, animated: false)
        
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
        
        destinationVC.tabBarItem = UITabBarItem(title: "Explore", image: UIImage(systemName: "map"), tag: 2)
        navigationController.setViewControllers([destinationVC], animated: false)
    }
    
    func login(_ completion: @escaping (Result<Void, Error>) -> Void) {
        parentCoordinator?.login { [weak self] result in
            if case .success = result {
                self?.handleAuthenticationChange()
            }
            completion(result)
        }
    }
    
    func logout(_ completion: @escaping (Result<Void, Error>) -> Void) {
        parentCoordinator?.logout { [weak self] result in
            self?.handleAuthenticationChange()
            completion(result)
        }
    }
    
}
