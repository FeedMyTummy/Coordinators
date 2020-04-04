//
//  SettingsVC.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/2/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    weak var coordinator: SettingsCoordinator?
    
    static func make() -> SettingsVC {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: String(describing: self))
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
