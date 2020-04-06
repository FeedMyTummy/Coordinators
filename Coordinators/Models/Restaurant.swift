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
    static let AuthenticationDidChange = Notification.Name("AuthenticationDidChangeNotification")
}

class AuthenticationObserver {
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(authenticationDidChange), name: .AuthenticationDidChange, object: nil)
    }
    
    @objc func authenticationDidChange() {
        print("AuthenticationObserver: authenticationDidChange")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .AuthenticationDidChange, object: nil)
    }
    
}
