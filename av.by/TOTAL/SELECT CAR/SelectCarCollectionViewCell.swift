import UIKit

final class SelectCarCollectionViewCell: UICollectionViewCell {
    // MARK: PRIVATE PROPERTIES:

    private let imageView = UIImageView()

    // MARK: LIFECYCLE:

    override init(frame: CGRect) {
        super.init(frame: frame)

        // MARK: IMAGE VIEW:

        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: PUBLIC FUNC FOR IMAGES:

    func setImage(_ image: UIImage) {
        imageView.image = image
    }
}
