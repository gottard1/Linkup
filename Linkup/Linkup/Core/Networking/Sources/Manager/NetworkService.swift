//
//  NetworkManager.swift
//  Networking
//
//  Created by Marcel Felipe Gottardi Anesi on 10/03/25.
//

import Foundation
import Combine

public protocol NetworkServiceProtocol {
    func fetch<T: Decodable>(from target: BaseTarget, responseType: T.Type) -> AnyPublisher<T, NetworkError>
}

public final class NetworkService: NetworkServiceProtocol {
    
    public init() {}
    
    public func fetch<T: Decodable>(from target: BaseTarget, responseType: T.Type) -> AnyPublisher<T, NetworkError> {
        guard let url = URL(string: target.path) else {
            return Fail(error: .invalidURL).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = target.method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let body = target.body {
            do {
                request.httpBody = try JSONEncoder().encode(body)
            } catch {
                return Fail(error: NetworkError.decodingError(error)).eraseToAnyPublisher()
            }
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .mapError { NetworkError.requestFailed($0) }
            .flatMap { result -> AnyPublisher<T, NetworkError> in
                self.decode(result.data)
            }
            .eraseToAnyPublisher()
    }
    
    private func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, NetworkError> {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return Just(data)
            .decode(type: T.self, decoder: decoder)
            .mapError { NetworkError.decodingError($0) }
            .eraseToAnyPublisher()
    }
}
