//
//  DogAPIManager.swift
//  DogBreedFinder
//
//  Created by Nuhu Sulemana on 18/02/2024.
//

import UIKit

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

class DogAPIManager {
    
    func getDogBreeds(url: String) async throws -> DogModel {
        guard let url = URL(string: breedListURL) else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(DogModel.self, from: data)
            return decodedData
        } catch {
            throw APIError.invalidURL
        }
    }
    
    func getDogBreedsImages(url: String) async throws -> Breed {
        guard let url = URL(string: url) else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(Breed.self, from: data)
            return decodedData
        } catch {
            throw APIError.invalidURL
        }
    }
    
}



