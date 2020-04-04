//
//  ViewController.swift
//  Coordinators
//
//  Created by Nicolas Silva on 3/31/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ExploreVC: UIViewController {
    
    weak var coordinator: ExploreCoordinator?
    
    static func make() -> ExploreVC {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: String(describing: self))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}

