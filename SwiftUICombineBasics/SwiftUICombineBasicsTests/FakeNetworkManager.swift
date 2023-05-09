//
//  FakeNetworkManager.swift
//  SwiftUICombineBasicsTests
//
//  Created by Taijaun Pitt on 05/05/2023.
//

import Foundation
import Combine
@testable import SwiftUICombineBasics

class FakeNetworkManager:NetworkableProtocol {
    
    func getPlanetsFromApi<T>(url: URL, type: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
        do {
            let bundle = Bundle(for: FakeNetworkManager.self)
            guard let path = bundle.url(forResource: url.absoluteString, withExtension: "json") else {
                return Fail(error: NetworkError.invalidURL)
                    .eraseToAnyPublisher()
            }
            let data = try Data(contentsOf: path)
            let planetList = try JSONDecoder().decode(T.self, from: data)
            return Just(planetList)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: NetworkError.dataNotFound)
                .eraseToAnyPublisher()
        }
        
    }
    
    
}
