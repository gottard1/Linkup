//
//  UpdateProfileRequest.swift
//  Login
//
//  Created by Marcel Felipe Gottardi Anesi on 11/03/25.
//

import Foundation

struct UpdateProfileRequest: Encodable {
    let name: String
    let bio: String?
    let avatarURL: String?
}
