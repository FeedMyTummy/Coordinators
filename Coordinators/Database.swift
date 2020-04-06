//
//  Database.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/2/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

enum DataBaseError: Error {
    case authentication
    case unknown
}

enum AuthenticationStatus {
    case loggedIn
    case loggeOut
}

protocol DatabaseService {
    var isLoggedIn: AuthenticationStatus { get }
    
    func getRestaurants(_ completion: @escaping (Result<[Restaurant], Error>) -> Void)
    func login(_ completion: @escaping (Result<Void, Error>) -> Void)
    func logout(_ completion: @escaping (Result<Void, Error>) -> Void)
}

final class Database: DatabaseService {
    
    private var _isLoggedIn = AuthenticationStatus.loggeOut
    
    static let shared = Database()
    
    var isLoggedIn: AuthenticationStatus { _isLoggedIn }
    
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
            _isLoggedIn = .loggedIn
            completion(.success(()))
        } else {
            completion(.failure(DataBaseError.authentication))
        }
    }
    
    func logout(_ completion: @escaping (Result<Void, Error>) -> Void) {
        if simulateSuccess() {
            _isLoggedIn = .loggeOut
            completion(.success(()))
        } else {
            completion(.failure(DataBaseError.unknown))
        }
    }
    
    func simulateSuccess() -> Bool { true }
    
}

final class MockLogoutFailureDatabase: DatabaseService {
    
    private var _isLoggedIn = AuthenticationStatus.loggeOut
    var isLoggedIn: AuthenticationStatus { _isLoggedIn }
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
