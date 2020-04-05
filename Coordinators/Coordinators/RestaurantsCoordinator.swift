//
//  RestaurantsCoordinator.swift
//  Coordinators
//
//  Created by Nicolas Silva on 3/31/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class RestaurantsCoordinator: Coordinator {
    
    var router: Router
    var childCoordinators = [Coordinator]()
    
    init(router: Router) {
        self.router = router
        print("RestaurantsCoordinator: init")
    }
    
    func present(animated: Bool, onDismissed: (() -> Void)?) {
        Database.shared.getRestaurants { [weak self] restaurants in
            guard let self = self else { return }
            switch restaurants {
            case .success(let restaurants):
                let restaurantsVC = RestaurantsVC.make(restaurants, coordinator: self)
                self.router.present(restaurantsVC, animated: animated)
            case .failure:
                // TODO:
                break
            }
        }
    }
    
    deinit {
        print("RestaurantsCoordinator: deinit")
    }
    
}
