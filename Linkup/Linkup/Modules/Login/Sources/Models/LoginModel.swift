//
//  LoginRequest.swift
//  Login
//
//  Created by Marcel Felipe Gottardi Anesi on 11/03/25.
//

import Foundation

struct LoginRequest: Encodable {
    let email: String
    let password: String
}

struct LoginResponse: Codable {
    let token: String
}
