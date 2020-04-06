//
//  AuthenticationDelegate.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/5/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

@objc protocol AuthenticationDelegate: class {
    @objc func authenticationDidChange()
}

extension AuthenticationDelegate {
    
    func addAuthenticationDelegateObserver(_ observer: Any) {
        NotificationCenter.default.addObserver(self, selector: #selector(authenticationDidChange), name: .authenticationDidChange, object: nil)
    }
    
    func removeAuthenticationDelegateObserver(_ observer: Any) {
        NotificationCenter.default.removeObserver(self, name: .authenticationDidChange, object: nil)
    }
}
