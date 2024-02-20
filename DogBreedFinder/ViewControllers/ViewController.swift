//
//  ViewController.swift
//  DogBreedFinder
//
//  Created by Nuhu Sulemana on 18/02/2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dogTableView: UITableView!
    
    private let viewModel = BreedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dogTableView.dataSource = self
        dogTableView.delegate = self
        
        viewModel.dogDelegate = self
        viewModel.fetchDogs(url: dogAPIURL)
        
        self.navigationItem.title = "Breeds"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dogTableView.dequeueReusableCell(withIdentifier: "BreedCell", for: indexPath)
        cell.textLabel?.text = viewModel.dogs?.message[indexPath.row]
        return cell
    }
}
    
extension ViewController: DogServices {
    func reloadData() {
        self.dogTableView.reloadData()
    }
}
    


