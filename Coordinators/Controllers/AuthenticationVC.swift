//
//  AuthenticationVC.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/2/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class AuthenticationVC: UIViewController {
    
    weak var coordinator: Authenticatable?
    
    static func make() -> AuthenticationVC {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: String(describing: self))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction private func login(_ sender: Any) {
        coordinator?.login { result in
            switch result {
            case .success:
                print("AuthenticationVC Success login")
            case .failure(let error):
                print("AuthenticationVC Failure login \(error)")
            }
        }
    }
}
