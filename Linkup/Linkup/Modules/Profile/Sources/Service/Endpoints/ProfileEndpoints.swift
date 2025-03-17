//
//  ProfileEndpoints.swift
//  Profile
//
//  Created by Marcel Felipe Gottardi Anesi on 11/03/25.
//

import Foundation
import Networking

public enum ProfileEndpoints {
    case getProfile
    case deleteAccount
    
    var baseURL: String { "http://127.0.0.1:8000" }
}

extension ProfileEndpoints: BaseTarget {
    
    public var path: String {
        switch self {
        case .getProfile: return "\(baseURL)/profile/detail"
        case .deleteAccount: return "\(baseURL)/profile/delete"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .getProfile: return .GET
        case .deleteAccount: return .DELETE
        }
    }
    
    public var headers: [String: String]? {
        guard let token = UserDefaults.standard.string(forKey: "authToken") else { return nil }
        return ["Authorization": "Bearer \(token)"]
    }
    
    public var queryParameters: [String : String]? {
        return nil
    }
    
    public var body: (any Encodable)? {
        return nil
    }
}
