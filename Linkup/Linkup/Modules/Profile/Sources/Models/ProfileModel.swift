//
//  Profile.swift
//  Profile
//
//  Created by Marcel Felipe Gottardi Anesi on 11/03/25.
//


struct Profile: Codable {
    let id: Int
    let name: String
    let email: String
    let bio: String?
    let avatarURL: String?
    let createdAt: String
}