//
//  BreedDetailsCollectionViewCell.swift
//  DogBreedFinder
//
//  Created by Nuhu Sulemana on 20/02/2024.
//

import UIKit

class BreedDetailsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dogImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        dogImageView.layer.cornerRadius = 5.0 // Adjust the radius as needed
        dogImageView.layer.masksToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dogImageView.image = nil // Reset the image or any other content
    }
}
