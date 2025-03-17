//
//  User.swift
//  Profile
//
//  Created by Marcel Felipe Gottardi Anesi on 10/03/25.
//

import Foundation

struct User: Identifiable, Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
}
