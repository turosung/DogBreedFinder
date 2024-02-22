//
//  BreedDetailsViewModel.swift
//  DogBreedFinder
//
//  Created by Nuhu Sulemana on 21/02/2024.
//

import Foundation

protocol BreedServices: AnyObject {
    func reloadData()
}

class BreedDetailsViewModel {
    
    private let apiManager = DogAPIManager()
    weak var breedDelegate: BreedServices?
    
    var breeds: Breed? {
        didSet {
            self.breedDelegate?.reloadData()
        }
    }
    
    
    @MainActor func fetchBreeds(breed: String) {
        let imageURL = "https://dog.ceo/api/breed/\(breed)/images/random/10"
        Task {
            do {
                let breedResponse: Breed = try await apiManager.getDogBreedsImages(url: imageURL)
                self.breeds = breedResponse
            } catch {
                print(error)
            }
            
        }
    }
    
    
}
