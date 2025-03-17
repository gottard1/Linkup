//
//  RegisterRequest.swift
//  Login
//
//  Created by Marcel Felipe Gottardi Anesi on 11/03/25.
//

import Foundation

struct RegisterRequest: Encodable {
    let email: String
    let password: String
    let name: String
}
