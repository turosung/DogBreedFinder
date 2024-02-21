//
//  DogListViewController.swift
//  DogBreedFinder
//
//  Created by Nuhu Sulemana on 18/02/2024.
//

import UIKit

class DogListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dogTableView: UITableView!
    
    private let viewModel = BreedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Breeds"
        
        dogTableView.dataSource = self
        dogTableView.delegate = self
        
        viewModel.dogDelegate = self
        viewModel.fetchDogs(url: dogAPIURL)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dogs?.message.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dogTableView.dequeueReusableCell(withIdentifier: "BreedCell", for: indexPath)
        cell.textLabel?.text = viewModel.dogs?.message[indexPath.row]
        return cell
    }
}
    
extension DogListViewController: DogServices {
    func reloadData() {
        self.dogTableView.reloadData()
    }
}
    


