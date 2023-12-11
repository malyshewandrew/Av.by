import UIKit

final class TotalListAdsCollectionViewCell: UICollectionViewCell {
    // MARK: - PROPERTIES:

    private let imageView = UIImageView()
    private let viewButton = UIButton()

    var onTap: (() -> ())?

    // MARK: - LIFECYCLE:

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureConstrains()
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ADD SUBVIEWS:

    private func addSubviews() {
        addSubviews(imageView, viewButton)
    }

    // MARK: - CONFIGURE CONSTRAINS:

    private func configureConstrains() {
        // MARK: IMAGE VIEW:

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        // MARK: VIEW BUTTON:

        viewButton.translatesAutoresizingMaskIntoConstraints = false
        viewButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        viewButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        viewButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        viewButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        viewButton.backgroundColor = .clear
        viewButton.addTarget(self, action: #selector(funcTest), for: .touchUpInside)
    }

    // MARK: - CONFIGURE UI:

    private func configureUI() {
        // MARK: - IMAGE VIEW:

        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }

    // MARK: - IMAGES:

    func setImage(_ image: UIImage) {
        imageView.image = image
    }

    @objc private func funcTest() {
        onTap?()
    }
}
