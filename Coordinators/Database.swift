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

final class Database {
    
    private var _isLoggedIn = false
    
    static let shared = Database()
    
    var isLoggedIn: Bool { _isLoggedIn }
    
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
            _isLoggedIn = true
            completion(.success(()))
        } else {
            completion(.failure(DataBaseError.authentication))
        }
    }
    
    func logout(_ completion: @escaping (Result<Void, Error>) -> Void) {
        if simulateSuccess() {
            _isLoggedIn = false
            completion(.success(()))
        } else {
            completion(.failure(DataBaseError.unknown))
        }
    }
    
    func simulateSuccess() -> Bool {
//        Int.random(in: 0...1).isMultiple(of: 2)
        true
    }
    
}
