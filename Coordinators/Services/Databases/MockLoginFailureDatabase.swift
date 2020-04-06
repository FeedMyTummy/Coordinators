//
//  MockLoginFailureDatabase.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/6/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

final class MockLoginFailureDatabase: DatabaseService {
    
    private var _isLoggedIn = AuthenticationStatus.loggeOut
    var isLoggedIn: AuthenticationStatus { _isLoggedIn }
    static let shared = MockLoginFailureDatabase()
    
    private init() { /* EMPTY */ }
    
    func getRestaurants(_ completion: @escaping (Result<[Restaurant], Error>) -> Void) {
        let restaurants = [
            Restaurant(name: "A"),
            Restaurant(name: "B"),
            Restaurant(name: "C"),
            Restaurant(name: "D")
        ]
        
        completion(.success(restaurants))
    }
    
    func login(_ completion: @escaping (Result<Void, Error>) -> Void) {
        completion(.failure(DataBaseError.authentication))
    }
    
    func logout(_ completion: @escaping (Result<Void, Error>) -> Void) {
        completion(.success(()))
    }
    
}
