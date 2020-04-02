//
//  RestaurantsVC.swift
//  Coordinators
//
//  Created by Nicolas Silva on 3/31/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class RestaurantsVC: UIViewController {
    
    weak var coordinator: RestaurantsCoordinator?
    
    static func make() -> RestaurantsVC {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: String(describing: self))
    }
    
}
