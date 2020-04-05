//
//  ProfileVC.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/3/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ProfileVC: DebugVC {
    
    private unowned var coordinator: SettingsCoordinator!
    
    static func make(coordinator: SettingsCoordinator) -> ProfileVC {
        let profileVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: String(describing: self)) as! ProfileVC
        profileVC.coordinator = coordinator
        
        return profileVC
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}
