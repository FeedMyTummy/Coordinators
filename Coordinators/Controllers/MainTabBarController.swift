//
//  MainTabBarController.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/1/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let restaurants = RestaurantsCoordinator(navigationController: UINavigationController())
    let exploreCoordinator = ExploreCoordinator(navigationController: UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        restaurants.start()
        exploreCoordinator.start()
        viewControllers = [restaurants.navigationController,
                           exploreCoordinator.navigationController]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
