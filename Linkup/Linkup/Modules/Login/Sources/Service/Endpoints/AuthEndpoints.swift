//
//  AuthEndpoints.swift
//  Login
//
//  Created by Marcel Felipe Gottardi Anesi on 11/03/25.
//

import Foundation
import Networking

public enum AuthEndpoints {
    case login(email: String, password: String)
    case register(email: String, password: String, name: String)
    
    var baseURL: String { "http://127.0.0.1:8000" }
}

extension AuthEndpoints: BaseTarget {
    
    public var path: String {
        switch self {
        case .login: return "\(baseURL)/auth/login"
        case .register: return "\(baseURL)/auth/register"
        }
    }
    
    public var method: HTTPMethod {
        return .POST
    }
    
    public var headers: [String : String]? {
        return nil
    }
    
    public var queryParameters: [String : String]? {
        return nil
    }
    
    public var body: Encodable? {
        switch self {
        case .login(let email, let password):
            return LoginRequest(email: email, password: password)
        case .register(let email, let password, let name):
            return RegisterRequest(email: email, password: password, name: name)
        }
    }
}
