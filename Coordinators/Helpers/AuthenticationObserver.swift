//
//  AuthenticationObserver.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/6/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class AuthenticationObserver {
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(loginSuccess), name: .AuthenticationDidLogin, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(loggoutSuccess), name: .AuthenticationDidLoggout, object: nil)
    }
    
    @objc private func loginSuccess() {
        authenticationDidChange(status: .loggedIn)
    }
    
    @objc private func loggoutSuccess() {
        authenticationDidChange(status: .loggedOut)
    }
    
    func authenticationDidChange(status: AuthenticationStatus) {
        print("IF YOU SEE THIS, YOU FORGOT TO OVERRIDEauthenticationDidChange. P.S THE STATUS IS: \(status)")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .AuthenticationDidLogin, object: nil)
        NotificationCenter.default.removeObserver(self, name: .AuthenticationDidLoggout, object: nil)
    }
    
}
