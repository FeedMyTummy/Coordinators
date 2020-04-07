//
//  MockLogoutFailureDatabase.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/6/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

final class MockLogoutFailureDatabase: DatabaseService {
    
    private var _loginStatus = AuthenticationStatus.loggedOut
    var loginStatus: AuthenticationStatus { _loginStatus }
    static let shared = MockLogoutFailureDatabase()
    
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
        completion(.success(()))
    }
    
    func logout(_ completion: @escaping (Result<Void, Error>) -> Void) {
        completion(.failure(DataBaseError.unknown))
    }
    
}
