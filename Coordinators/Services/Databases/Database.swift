//
//  Database.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/2/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

final class Database: DatabaseService {
    
    private var _loginStatus = AuthenticationStatus.loggedOut
    
    static let shared = Database()
    
    var loginStatus: AuthenticationStatus { _loginStatus }
    
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
        if simulateSuccess() {
            _loginStatus = .loggedIn
            completion(.success(()))
        } else {
            completion(.failure(DataBaseError.authentication))
        }
    }
    
    func logout(_ completion: @escaping (Result<Void, Error>) -> Void) {
        if simulateSuccess() {
            _loginStatus = .loggedOut
            completion(.success(()))
        } else {
            completion(.failure(DataBaseError.unknown))
        }
    }
    
    func simulateSuccess() -> Bool { true }
    
}
