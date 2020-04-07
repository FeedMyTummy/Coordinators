//
//  MockGetRestaurantsFailureDatabase.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/6/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

final class MockGetRestaurantsFailureDatabase: DatabaseService {
    
    private var _loginStatus = AuthenticationStatus.loggedOut
    var loginStatus: AuthenticationStatus { _loginStatus }
    static let shared = MockGetRestaurantsFailureDatabase()
    
    private init() { /* EMPTY */ }
    
    func getRestaurants(_ completion: @escaping (Result<[Restaurant], Error>) -> Void) {
        completion(.failure(DataBaseError.unknown))
    }
    
    func login(_ completion: @escaping (Result<Void, Error>) -> Void) {
        completion(.success(()))
    }
    
    func logout(_ completion: @escaping (Result<Void, Error>) -> Void) {
        completion(.success(()))
    }
    
}
