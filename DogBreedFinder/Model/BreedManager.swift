//
//  BreedManager.swift
//  DogBreedFinder
//
//  Created by Nuhu Sulemana on 18/02/2024.
//

import UIKit

struct BreedManager {
    // Use or rewrite network calls in async await instead of using completion handles
    // No need to really use Combine
    func getDogBreeds() {
        Task {
            do {
                let loadData = try await loadData(url: "https://dog.ceo/api/breeds/list")
                let decodedData = try JSONDecoder().decode(BreedModel.self, from: loadData)
                print(decodedData)
            } catch {
                print("Error decoding data!")
            }
        }
//        guard let url = URL(string: "https://dog.ceo/api/breeds/list") else { return }
//        let task = URLSession.shared.dataTask(with: url) { data, _ , error in
//            if error != nil {
//                print("There is something wrong here !!")
//                return
//            }
//            
//            guard let safeData = data else { return }
////            print(try? JSONSerialization.jsonObject(with: safeData, options: []))
//            let decoder = JSONDecoder()
//            do {
//                let decodedData = try decoder.decode(BreedModel.self, from: safeData)
//                print(decodedData)
//            } catch {
//                print("Error decoding data!")
//            }
//        }
//        task.resume()
    }
}

// NOTES:

// 1. Create another function in BreedManager which will load the images for the dog breeds in the detailed view controller
// 2. For the first screen, it'll show a table view list of all the dog breeds
// 3. When a breed in the list is selected, it should navigate you to the second screen which shows you 10 images of the breed
// 4. Make image loading async await - search how to load images asynchronously in swift
// 5. If you are using a function frequently, create it differently or as a class and reuse it or pass it around in your code
// 6. Go over Swift Documentation again to brush up my knowledge
// 7. Stackoverflow,
// 8. Use push or how to navigate from one view controller to next using push 
