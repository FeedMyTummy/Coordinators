//
//  DebugVC.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/5/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class DebugVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(String(describing: self)) viewDidLoad")
    }
    
    deinit {
        print("\(String(describing: self)) deinit")
    }
    
}
