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
    let databaseSource: DatabaseService
    
    init(navigationController: UINavigationController, databaseSource: DatabaseService = Database.shared) {
        self.navigationController = navigationController
        self.databaseSource = databaseSource
    }
    
    func start() {
        databaseSource.getRestaurants { [weak self] restaurants in
            guard let self = self else { return }
            switch restaurants {
            case .success(let restaurants):
                let restaurantsVC = RestaurantsVC.make(restaurants, coordinator: self)
                restaurantsVC.tabBarItem = UITabBarItem(title: "Restaurants", image: UIImage(systemName: "list.dash"), tag: 0)
                self.navigationController.pushViewController(restaurantsVC, animated: true)
            case .failure:
                // TODO:
                break
            }
        }
    }
    
}
