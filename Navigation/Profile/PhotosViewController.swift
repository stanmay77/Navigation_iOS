
import UIKit
import iOSIntPackage
import Foundation

class PhotosViewController: UIViewController {
    
    var imageGallery: [UIImage] = [         UIImage(named: "se1")!,
                                            UIImage(named: "se1")!,
                                            UIImage(named: "xs")!,
                                            UIImage(named: "xs")!,
                                            UIImage(named: "xs")!,
                                            UIImage(named: "se1")!,
                                            UIImage(named: "se1")!,
                                            UIImage(named: "xs")!,
                                            UIImage(named: "xs")!,
                                            UIImage(named: "xs")!]
    
    var filteredImagesGallery: [UIImage?] = []
    
    
 //   let photosFacade = ImagePublisherFacade()
    
    lazy var photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.sectionInset = UIEdgeInsets(top: Constants.photoLibraryInsets,
                                           left: Constants.photoLibraryInsets,
                                           bottom: Constants.photoLibraryInsets,
                                           right: Constants.photoLibraryInsets)
        view.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.reuseIdentifier)
        layout.minimumLineSpacing = Constants.photoLibraryInsets
        layout.minimumInteritemSpacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        prepareLargeGallery()
        getFilteredImages()
        
       // photosFacade.subscribe(self)
       // photosFacade.addImagesWithTimer(time: 1, repeat: 20, userImages: nil)
        

    }
    
    func getFilteredImages() {
        NSLog("Started image processing")
        ImageProcessor().processImagesOnThread(sourceImages: imageGallery, filter: .crystallize(radius: 110.0), qos: .userInteractive) { images in
                DispatchQueue.main.async {
                for image in images {
                    self.filteredImagesGallery.append(UIImage(cgImage: image!))
                }
                self.photoCollectionView.reloadData()
                NSLog("Finished image processing")
            }
        }
        }
    
    func prepareLargeGallery() {
        var i = 0
        while i < 3 {
            imageGallery.append(contentsOf: imageGallery)
            i+=1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    func configureUI() {
        title = "Photo Gallery"
        view.addSubview(photoCollectionView)
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        
        NSLayoutConstraint.activate([
            photoCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            photoCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            photoCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photoCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
  
    }
    
}

extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredImagesGallery.count
        //return Photo.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else {
            return UICollectionViewCell()
        }
        // cell.configureUI(for: Photo.photos[indexPath.row])
        

        cell.configureUI(for: filteredImagesGallery[indexPath.row]!)
       

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = (view.frame.width - 32) / 3
        let height = width
        return CGSize(width: Double(width), height: Double(height))
    }
}

//extension PhotosViewController: ImageLibrarySubscriber {
//    func receive(images: [UIImage]) {
//        galleryImages.append(images.last!)
//        photoCollectionView.reloadData()
//    }
//    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        photosFacade.removeSubscription(for: self)
//        photosFacade.rechargeImageLibrary()
//    }
//    
//}


