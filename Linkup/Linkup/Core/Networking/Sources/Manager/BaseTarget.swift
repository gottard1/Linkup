//
//  APIRequest.swift
//  Networking
//
//  Created by Marcel Felipe Gottardi Anesi on 11/03/25.
//

import Foundation

public protocol BaseTarget {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var queryParameters: [String: String]? { get }
    var body: Encodable? { get }
}
