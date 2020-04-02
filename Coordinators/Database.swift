//
//  Database.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/2/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

final class Database {
    static let shared = Database()
    
    var isLoggedIn: Bool { false }
    
    private init() { /* EMPTY */ }
    
    
    func getRestaurants(_ completions: @escaping (Result<[Restaurant], Error>) -> Void) {
        let restaurants = [Restaurant(name: "A"),
                           Restaurant(name: "B"),
                           Restaurant(name: "C"),
                           Restaurant(name: "D"), ]
        
        completions(.success(restaurants))
    }
    
}
