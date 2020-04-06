//
//  AuthenticationDelegate.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/5/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

@objc protocol AuthenticationNotificationObservable: class {
    @objc func authenticationDidChange()
}

extension AuthenticationNotificationObservable {
    
    func addNotificationObserver(_ observer: Any) {
        NotificationCenter.default.addObserver(self, selector: #selector(authenticationDidChange), name: .authenticationDidChange, object: nil)
    }
    
    func removeNotificationDelegateObserver(_ observer: Any) {
        NotificationCenter.default.removeObserver(self, name: .authenticationDidChange, object: nil)
    }
}
