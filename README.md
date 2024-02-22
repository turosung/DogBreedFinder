# DogBreedFinder

DogBreedFinder is an iOS app for dog lovers and everyone, which provides you with a list of dog breeds and when you select a breed, it provides you with random cute images of those breeds.


## Getting Started

### API Integration

DogBreedFinder uses the Dog API to fetch information about hundreds of dog breeds. The API has different endpoints to retrieve different data about the dog breeds. Below are two endpoints used to fetch a list of dog breeds and random images of a dog breed.

```
GET 'https://dog.ceo/api/breeds/list' 
GET 'https://dog.ceo/api/breed/{name}/images'
```

## Technologies Used

The app is built with the following:
- Swift - programming language for iOS development.

- UIKit - this is an iOS framework used to build user interface. The user interfaces were built using Storyboard, UITableView, UICollectionView.

- Asynchronous URLSession - this is used to make calls to the API and to get responses / data which are then implemented in the app.

- SDWebImage - This is a third party library which is asynchronous image downloader used to fetch random images from the URL endpoint and also provides caching. 


## Installation 

### Prerequisites

Xcode, Swift, Cocoapods

### Installing

1. Clone the repository: `https://github.com/turosung/DogBreedFinder.git`

2. Open the project in Xcode: `cd DogBreedFinder` and then `open DogBreedFinder.xcworkspace`

3. Then Build and Run the app in the Xcode simulator or on a connected device.

## Demo
[DogBreedFinder](https://github.com/turosung/DogBreedFinder/assets/82477640/b1374119-1539-4779-8f3e-13458affd095)
