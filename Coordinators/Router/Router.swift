//
//  Router.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/5/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

public protocol Router: class {
    
    func present(_ viewController: UIViewController, animated: Bool)
    func present(_ viewController: UIViewController, animated: Bool, onDismissed: (()->Void)?)
    
    func dismiss(animated: Bool)
    
}

extension Router {
    
    public func present(_ viewController: UIViewController, animated: Bool) {
        present(viewController, animated: animated, onDismissed: nil)
    }
    
}
