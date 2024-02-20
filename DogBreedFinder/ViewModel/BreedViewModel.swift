//
//  BreedViewModel.swift
//  DogBreedFinder
//
//  Created by Nuhu Sulemana on 20/02/2024.
//

import Foundation

protocol DogServices: AnyObject {
    func reloadData()
}

class BreedViewModel {
    
    private let dogManager = DogAPIManager()
    weak var dogDelegate: DogServices?
    
    var dogs: BreedModel? {
        didSet {
            self.dogDelegate?.reloadData()
        }
    }
    
    
    @MainActor func fetchDogs(url: String) {
        Task {
            do {
                let dogResponse: BreedModel = try await dogManager.getDogBreeds(url: dogAPIURL)
                print(dogResponse)
                self.dogs = dogResponse
            } catch {
                print(error)
            }
            
        }
    }
}
