//
//  Coordinator.swift
//  Coordinators
//
//  Created by Nicolas Silva on 3/31/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

public protocol Coordinator: class {
    
    var childCoordinators: [Coordinator] { get set }
    var router: Router { get }
    
    func present(animated: Bool, onDismissed: (() -> Void)?)
    func dismiss(animated: Bool)
    func presentChild(_ child: Coordinator, animated: Bool, onDismissed: (() -> Void)?)
    
}


extension Coordinator {
    
    public func dismiss(animated: Bool) {
        router.dismiss(animated: animated) }
    
    public func presentChild(_ child: Coordinator, animated: Bool, onDismissed: (() -> Void)? = nil) {
        childCoordinators.append(child)
        child.present(animated: animated, onDismissed: { [weak self, weak child] in
            guard let self = self, let child = child else { return }
            self.removeChild(child)
            onDismissed?()
        })
    }
    
    private func removeChild(_ child: Coordinator) {
        guard let index = childCoordinators.firstIndex(where: { $0 === child }) else { return }
        childCoordinators.remove(at: index) }
    
}
