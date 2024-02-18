//
//  ViewController.swift
//  DogBreedFinder
//
//  Created by Nuhu Sulemana on 18/02/2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dogTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dogTableView.dataSource = self
        dogTableView.delegate = self
        
        let breedManager = BreedManager()
        breedManager.getDogBreeds()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dogTableView.dequeueReusableCell(withIdentifier: "BreedCell", for: indexPath)
        return cell
    }
    


}

