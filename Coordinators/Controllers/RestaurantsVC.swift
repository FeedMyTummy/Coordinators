//
//  RestaurantsVC.swift
//  Coordinators
//
//  Created by Nicolas Silva on 3/31/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class RestaurantsVC: UIViewController {
    
    weak var coordinator: RestaurantsCoordinator?
    private var restaurants = [Restaurant]()
    
    @IBOutlet private weak var tableView: UITableView!
    
    static func make(_ restaurants: [Restaurant]) -> RestaurantsVC {
        let restaurantsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: String(describing: self)) as! RestaurantsVC
        restaurantsVC.restaurants = restaurants
        
        return restaurantsVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
    
}

extension RestaurantsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = restaurants[indexPath.row].name
        
        return cell
    }
    
    
}
