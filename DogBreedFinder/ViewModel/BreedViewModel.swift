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
    
    private let apiManager = DogAPIManager()
    weak var dogDelegate: DogServices?
    
    var dogs: DogModel? {
        didSet {
            self.dogDelegate?.reloadData()
        }
    }
    
    @MainActor func fetchDogs(url: String) {
        Task {
            do {
                let dogResponse: DogModel = try await apiManager.getDogBreeds(url: url)
                self.dogs = dogResponse
            } catch {
                print(error)
            }
            
        }
    }
}
