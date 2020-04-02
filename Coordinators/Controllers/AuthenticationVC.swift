//
//  AuthenticationVC.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/2/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class AuthenticationVC: UIViewController {
    
    weak var coordinator: SettingsCoordinator?
    
    static func make() -> AuthenticationVC {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: String(describing: self))
    }
    
}
