//
//  BreedDetailsViewController.swift
//  DogBreedFinder
//
//  Created by Nuhu Sulemana on 21/02/2024.
//

import UIKit
import SDWebImage

class BreedDetailsViewController: UIViewController {
    
    @IBOutlet weak var breedImageListCollectionView: UICollectionView!
    
    private let viewModel = BreedDetailsViewModel()
    
    var breedString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "\(self.breedString)"
        
        breedImageListCollectionView.register(UINib(nibName: "BreedDetailsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "BreedDetailsCollectionViewCell")
        breedImageListCollectionView.delegate = self
        breedImageListCollectionView.dataSource = self
        
        viewModel.breedDelegate = self
        viewModel.fetchBreeds(breed: self.breedString)
    }
}


extension BreedDetailsViewController: UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.breeds?.message.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let data =  viewModel.breeds?.message[indexPath.row] ?? ""
        
        let cell : BreedDetailsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BreedDetailsCollectionViewCell", for: indexPath) as! BreedDetailsCollectionViewCell
        cell.dogImageView.sd_setImage(with: URL(string: data), placeholderImage: UIImage(named: "blank_profile_avatar"))
        cell.dogImageView.contentMode = .scaleAspectFill
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 20.0 // Adjust as needed
        let width = (collectionView.bounds.width - spacing) / 2.0
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0 // Adjust as needed
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if let imageURL = viewModel.breeds?.message[indexPath.row] {
            let imagePopupVC = ImagePopupViewController()
            imagePopupVC.imageURL = imageURL
            present(imagePopupVC, animated: true, completion: nil)
        }
    }
}


extension BreedDetailsViewController: BreedServices {
    func reloadData() {
        DispatchQueue.main.async {
            self.breedImageListCollectionView.reloadData()
        }
    }
}


