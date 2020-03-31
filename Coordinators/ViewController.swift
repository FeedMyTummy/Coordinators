//
//  ViewController.swift
//  Coordinators
//
//  Created by Nicolas Silva on 3/31/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    
    static func make() -> ViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: String(describing: self))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func goToRestaurantsVC(_ sender: Any) {
        coordinator?.gotoRestaurantVC()
    }
    
}

