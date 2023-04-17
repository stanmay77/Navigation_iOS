import UIKit

final class PhotosCollectionViewCell: UICollectionViewCell {
    
    
    static let reuseIdentifier = "photosCollectionCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureUI(for photo: Photo) {
        
        let photoView = PhotoImageView(frame: .zero, photo: photo)
        addSubview(photoView)
        
        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: topAnchor),
            photoView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            photoView.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ]
        )
        
    }
    
    
}
