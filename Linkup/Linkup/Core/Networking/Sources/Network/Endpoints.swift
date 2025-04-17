//
//  APIEndpoint.swift
//  Networking
//
//  Created by Marcel Felipe Gottardi Anesi on 10/03/25.
//

import Foundation

public enum Endpoints {
    case login
    case register
    case profileDetail
    case delete
    
    var url: String {
        let baseURL = "http://127.0.0.1:8000"
        switch self {
            case .login:
                return "\(baseURL)/auth/login"
            case .register:
                return "\(baseURL)/auth/register"
            case .profileDetail:
                return "\(baseURL)/profile/detail"
            case .delete:
                return "\(baseURL)/profile/delete"
        }
    }
}
