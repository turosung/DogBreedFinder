//
//  NetworkManager.swift
//  DogBreedFinder
//
//  Created by Nuhu Sulemana on 18/02/2024.
//

import Foundation

enum APIErrors: Error {
    case invalidUrl
}
func loadData(url: String) async throws -> Data {
    guard let url = URL(string: url) else {
        throw APIErrors.invalidUrl
    }
    let (data, response) = try await URLSession.shared.data(from: url)
    return data
}
