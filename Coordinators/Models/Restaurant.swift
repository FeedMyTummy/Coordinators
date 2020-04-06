//
//  Restaurant.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/2/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

struct Restaurant {
    let name: String
}

extension Notification.Name {
    static let AuthenticationDidLogin = Notification.Name("AuthenticationDidLoginNotification")
    static let AuthenticationDidLoggout = Notification.Name("AuthenticationDidLoggoutNotification")
}

class AuthenticationObserver {
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(loginSuccess), name: .AuthenticationDidLogin, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(loggoutSuccess), name: .AuthenticationDidLoggout, object: nil)
    }
    
    @objc private func loginSuccess() {
        authenticationDidChange(status: .loggedIn)
    }
    
    @objc private func loggoutSuccess() {
        authenticationDidChange(status: .loggeOut)
    }
    
    func authenticationDidChange(status: AuthenticationStatus) {
        print("AuthenticationObserver: authenticationDidChange: \(status)")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .AuthenticationDidLogin, object: nil)
        NotificationCenter.default.removeObserver(self, name: .AuthenticationDidLoggout, object: nil)
    }
    
}
