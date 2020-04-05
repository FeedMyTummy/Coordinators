//
//  ViewController.swift
//  Coordinators
//
//  Created by Nicolas Silva on 3/31/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ExploreVC: DebugVC {
    
    private unowned var coordinator: ExploreCoordinator!
    
    static func make(coordinator: ExploreCoordinator) -> ExploreVC {
        let exploreVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: String(describing: self)) as! ExploreVC
        exploreVC.coordinator = coordinator
        
        return exploreVC
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}

