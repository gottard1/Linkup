//
//  NetworkError.swift
//  Networking
//
//  Created by Marcel Felipe Gottardi Anesi on 10/03/25.
//

import Foundation

public enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case decodingError(Error)
}
