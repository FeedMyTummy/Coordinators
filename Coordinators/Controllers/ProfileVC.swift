//
//  ProfileVC.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/3/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    weak var coordinator: SettingsCoordinator?
    
    static func make() -> ProfileVC {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: String(describing: self))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
