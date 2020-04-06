//
//  DatabaseService.swift
//  Coordinators
//
//  Created by Nicolas Silva on 4/6/20.
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
