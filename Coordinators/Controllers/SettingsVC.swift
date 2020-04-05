//
//  SettingsVC.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/2/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SettingsVC: DebugVC {
    
    private unowned var coordinator: SettingsCoordinator!
    
    static func make(coordinator: SettingsCoordinator) -> SettingsVC {
        let settingsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: String(describing: self)) as! SettingsVC
        settingsVC.coordinator = coordinator
        
        return settingsVC
    }
    
    deinit {
        print("SettingsVC: deinit")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction private func profileButtonTapped(_ sender: Any) {
        coordinator?.gotoProfile()
    }
    
    @IBAction private func logout(_ sender: Any) {
        coordinator?.logout { result in
            switch result {
            case .success:
                print("SettingsVC Success logout")
            case .failure(let error):
                print("SettingsVC Failure logout \(error)")
            }
        }
    }
}

class DebugVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(String(describing: self)) viewDidLoad")
    }
    
    deinit {
        print("\(String(describing: self)) deinit")
    }
    
}


