import UIKit

class CellSearch: UITableViewCell {
    // MARK: - PRIVATE PROPERTIES:

    // MARK: - VIEW:

    private let view = UIView()
    private let nameLabel = UILabel()
    private let bookmarkButton = UIButton()
    private let priceBynLabel = UILabel()
    private let priceBynSymbolLabel = UILabel()
    private let priceUsdLabel = UILabel()

    private var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())

    private let descriptionView = UIView()
    private let descriptionLabel = UILabel()

    // MARK: - HELPERS:

    func helpers() {
        // MARK: - VIEW:

        contentView.addSubviews(view)
        view.addSubviews(nameLabel, bookmarkButton, priceBynLabel, priceBynSymbolLabel, priceUsdLabel, collectionView, descriptionView)
        descriptionView.addSubviews(descriptionLabel)
    }

    // MARK: - CONFIGURE CONSTRAINS:

    func configureConstrains() {
        // MARK: - VIEW:

        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true

        // MARK: - NAME LABEL:

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true

        // MARK: - BOOKMARK BUTTON:

        bookmarkButton.translatesAutoresizingMaskIntoConstraints = false
        bookmarkButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        bookmarkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        bookmarkButton.heightAnchor.constraint(equalTo: nameLabel.heightAnchor, multiplier: 1).isActive = true

        // MARK: - PRICE BYN LABEL:

        priceBynLabel.translatesAutoresizingMaskIntoConstraints = false
        priceBynLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        priceBynLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        priceBynLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true

        // MARK: - PRICE BYN SYMBOL LABEL:

        priceBynSymbolLabel.translatesAutoresizingMaskIntoConstraints = false
        priceBynSymbolLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        priceBynSymbolLabel.leadingAnchor.constraint(equalTo: priceBynLabel.trailingAnchor, constant: 5).isActive = true
        priceBynSymbolLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true

        // MARK: - PRICE USD LABEL:

        priceUsdLabel.translatesAutoresizingMaskIntoConstraints = false
        priceUsdLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        priceUsdLabel.leadingAnchor.constraint(equalTo: priceBynSymbolLabel.trailingAnchor, constant: 20).isActive = true
        priceUsdLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        priceUsdLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true

        // MARK: - COLLECTION VIEW:

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: priceBynLabel.bottomAnchor, constant: 10).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.97).isActive = true

        // MARK: - DESCRIPTION VIEW:

        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 5).isActive = true
        descriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        descriptionView.heightAnchor.constraint(greaterThanOrEqualTo: descriptionLabel.heightAnchor, constant: 10).isActive = true
        descriptionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true

        // MARK: - DESCRIPTION LABEL:

        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 0).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true

    }

    // MARK: - CONFIGURE UI:

    func configureUI() {
        contentView.backgroundColor = .backgroundView
        selectionStyle = .none

        // MARK: - VIEW:

        view.backgroundColor = .backgroundCell
        view.layer.cornerRadius = 10

        // MARK: - NAME LABEL:

        nameLabel.font = .systemFont(ofSize: 18, weight: .medium, width: .standard)
        nameLabel.text = "Opel Astra H"

        // MARK: - BOOKMARK BUTTON:

        bookmarkButton.setImage(UIImage(systemName: "bookmark.square"), for: .normal)
        bookmarkButton.tintColor = .noSelectItem

        // MARK: - PRICE BYN LABEL:

        priceBynLabel.adjustsFontSizeToFitWidth = true
        priceBynLabel.font = .systemFont(ofSize: 26, weight: .black, width: .standard)
        priceBynLabel.text = "17845"

        // MARK: - PRICE BYN SYMBOL LABEL:

        priceBynSymbolLabel.adjustsFontSizeToFitWidth = true
        priceBynSymbolLabel.font = .systemFont(ofSize: 14, weight: .bold, width: .standard)
        priceBynSymbolLabel.text = "р."

        // MARK: - PRICE USD LABEL:

        priceUsdLabel.adjustsFontSizeToFitWidth = true
        priceUsdLabel.textColor = .gray
        priceUsdLabel.font = .systemFont(ofSize: 16, weight: .regular, width: .standard)
        priceUsdLabel.text = "5599"

        // MARK: - COLLECTION VIEW:

        collectionView.layer.cornerRadius = 5
        collectionView.backgroundColor = .clear

        // MARK: - DESCRIPTION VIEW:
        
        // MARK: - DESCRIPTION LABEL:
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 15, weight: .regular, width: .standard)
        descriptionLabel.text = "2018, автомат, 3.0, дизель, внедорожник, 169 000 км"
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        helpers()
        configureConstrains()
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
