//
//  MainCoordinator.swift
//  Coordinators
//
//  Created by Nicolas Silva on 3/31/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ExploreCoordinator: Coordinator, Authenticatable {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        handleAuthenticationChange()
    }
    
    private func handleAuthenticationChange() {
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
        
        destinationVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        navigationController.setViewControllers([destinationVC], animated: false)
    }
    
    func login(completion: @escaping (Result<Void, Error>) -> Void) {
        Database.shared.login()
        handleAuthenticationChange()
        completion(.success(()))
    }
    
    func logout(completion: @escaping (Result<Void, Error>) -> Void) {
        Database.shared.logout()
        handleAuthenticationChange()
        completion(.success(()))
    }
    
}
