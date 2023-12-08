import UIKit

protocol CellTableViewCellDelegate {
    func tapOnButtonHide()
    func tapOnButtonBookmark()
}

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

    private var topSticker = UIImageView()
    private var vinSticker = UIImageView()

    private let cityLabel = UILabel()
    private let dateLabel = UILabel()

    private let lineView = UIView()

    private let lizingButton = UIButton()
    private let lizingLable = UILabel()
    private let lizingPrice = UILabel()

    private var images = [UIImage]()

    var onTap: (() -> ())?

    var delegate: CellTableViewCellDelegate?

    // MARK: - HELPERS:

    func helpers() {
        // MARK: - VIEW:

        contentView.addSubviews(view)
        view.addSubviews(nameLabel, bookmarkButton, priceBynLabel, priceBynSymbolLabel, priceUsdLabel, collectionView, descriptionView, topSticker, vinSticker, cityLabel, dateLabel, lineView, lizingButton)
        descriptionView.addSubviews(descriptionLabel)
        lizingButton.addSubviews(lizingLable, lizingPrice)
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
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true

        // MARK: - BOOKMARK BUTTON:

        bookmarkButton.translatesAutoresizingMaskIntoConstraints = false
        bookmarkButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        bookmarkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        bookmarkButton.heightAnchor.constraint(equalTo: nameLabel.heightAnchor, multiplier: 1.2).isActive = true
        bookmarkButton.widthAnchor.constraint(equalTo: nameLabel.heightAnchor, multiplier: 1.2).isActive = true

        // MARK: - PRICE BYN LABEL:

        priceBynLabel.translatesAutoresizingMaskIntoConstraints = false
        priceBynLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4).isActive = true
        priceBynLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        priceBynLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true

        // MARK: - PRICE BYN SYMBOL LABEL:

        priceBynSymbolLabel.translatesAutoresizingMaskIntoConstraints = false
        priceBynSymbolLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4).isActive = true
        priceBynSymbolLabel.leadingAnchor.constraint(equalTo: priceBynLabel.trailingAnchor, constant: 5).isActive = true
        priceBynSymbolLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true

        // MARK: - PRICE USD LABEL:

        priceUsdLabel.translatesAutoresizingMaskIntoConstraints = false
        priceUsdLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 7).isActive = true
        priceUsdLabel.leadingAnchor.constraint(equalTo: priceBynSymbolLabel.trailingAnchor, constant: 10).isActive = true
        priceUsdLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        priceUsdLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true

        // MARK: - COLLECTION VIEW:

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: priceBynLabel.bottomAnchor, constant: 8).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.97).isActive = true

        // MARK: - DESCRIPTION VIEW:

        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 15).isActive = true
        descriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        descriptionView.heightAnchor.constraint(greaterThanOrEqualTo: descriptionLabel.heightAnchor, constant: 10).isActive = true
        descriptionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true

        // MARK: - DESCRIPTION LABEL:

        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 0).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true

        // MARK: - TOP STICKER:

        topSticker.translatesAutoresizingMaskIntoConstraints = false
        topSticker.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 9).isActive = true
        topSticker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        topSticker.heightAnchor.constraint(equalToConstant: 20).isActive = true
        topSticker.widthAnchor.constraint(equalToConstant: 50).isActive = true

        // MARK: - VIN STICKER:

        vinSticker.translatesAutoresizingMaskIntoConstraints = false
        vinSticker.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 9).isActive = true
        vinSticker.leadingAnchor.constraint(equalTo: topSticker.trailingAnchor, constant: 5).isActive = true
        vinSticker.heightAnchor.constraint(equalToConstant: 20).isActive = true
        vinSticker.widthAnchor.constraint(equalToConstant: 50).isActive = true

        // MARK: - CITY LABEL:

        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.topAnchor.constraint(equalTo: topSticker.bottomAnchor, constant: 12).isActive = true
        cityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        cityLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true

        // MARK: - DATE LABEL:

        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: topSticker.bottomAnchor, constant: 12).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: cityLabel.trailingAnchor, constant: 2).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true

        // MARK: - LINE VIEW:

        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 18).isActive = true
        lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 0.2).isActive = true
        lineView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.99).isActive = true

        // MARK: - LIZING BUTTON:

        lizingButton.translatesAutoresizingMaskIntoConstraints = false
        lizingButton.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 15).isActive = true
        lizingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        lizingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        lizingButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

        // MARK: - LIZING LABEL:

        lizingLable.translatesAutoresizingMaskIntoConstraints = false
        lizingLable.topAnchor.constraint(equalTo: lizingButton.topAnchor, constant: 1).isActive = true
        lizingLable.leadingAnchor.constraint(equalTo: lizingButton.leadingAnchor, constant: 10).isActive = true
        lizingLable.heightAnchor.constraint(equalToConstant: 15).isActive = true
        lizingLable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true

        // MARK: - LIZING PRICE:

        lizingPrice.translatesAutoresizingMaskIntoConstraints = false
        lizingPrice.topAnchor.constraint(equalTo: lizingButton.topAnchor, constant: 1).isActive = true
        lizingPrice.trailingAnchor.constraint(equalTo: lizingButton.trailingAnchor, constant: -10).isActive = true
        lizingPrice.heightAnchor.constraint(equalToConstant: 15).isActive = true
        lizingPrice.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
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

        // MARK: - BOOKMARK BUTTON:

        bookmarkButton.setImage(UIImage(named: "bookmark"), for: .normal)
        
        
        // MARK: - PRICE BYN LABEL:

        priceBynLabel.adjustsFontSizeToFitWidth = true
        priceBynLabel.font = .systemFont(ofSize: 26, weight: .black, width: .standard)

        // MARK: - PRICE BYN SYMBOL LABEL:

        priceBynSymbolLabel.adjustsFontSizeToFitWidth = true
        priceBynSymbolLabel.font = .systemFont(ofSize: 16, weight: .bold, width: .standard)
        priceBynSymbolLabel.text = "р."

        // MARK: - PRICE USD LABEL:

        priceUsdLabel.adjustsFontSizeToFitWidth = true
        priceUsdLabel.textColor = .gray
        priceUsdLabel.font = .systemFont(ofSize: 14, weight: .regular, width: .standard)

        // MARK: - COLLECTION VIEW:

        collectionView.layer.cornerRadius = 5
        collectionView.backgroundColor = .clear

        // MARK: - DESCRIPTION LABEL:

        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 15, weight: .regular, width: .standard)

        // MARK: - TOP STICKER:

        // MARK: - VIN STICKER:

        // MARK: - CITY LABEL:

        cityLabel.adjustsFontSizeToFitWidth = true
        cityLabel.textColor = .systemGray
        cityLabel.font = .systemFont(ofSize: 14, weight: .regular, width: .standard)

        // MARK: - DATE LABEL:

        dateLabel.adjustsFontSizeToFitWidth = true
        dateLabel.textColor = .systemGray
        dateLabel.font = .systemFont(ofSize: 12, weight: .regular, width: .standard)

        // MARK: - LINE VIEW:

        lineView.backgroundColor = .gray

        // MARK: - LIZING LABEL:

        lizingLable.textColor = .lizingText
        lizingLable.font = .systemFont(ofSize: 14, weight: .regular, width: .standard)
        lizingLable.text = "Лизинг"

        // MARK: - LIZING PRICE:

        lizingPrice.textColor = .lizingText
        lizingPrice.font = .systemFont(ofSize: 14, weight: .regular, width: .standard)
    }

    // MARK: - CONFIGURE:

    func configure(name: String, price: Int, dollar: Int, photos: [UIImage], year: Int, typeTransmission: TypeTransmission, sizeEngine: Double, typeEngine: TypeEngine, typeBody: TypeBody, odometr: Int, powerReserve: Int, wheelDrive: TypeWheelDrive, color: String, registartion: StatusRegistration, power: Int, fuelFlow: Double, vin: Bool, top: Bool, city: String, date: String, vinNumber: Int, description: String, complectation: String, change: String, lizing: Int) {
        nameLabel.text = name
        priceBynLabel.text = String(price)
        priceUsdLabel.text = "≈ \(dollar) $"
        images = photos
        descriptionLabel.text = "\(year)г., \(typeTransmission.rawValue), \(sizeEngine), \(typeEngine.rawValue), \(typeBody.rawValue), \(odometr) км."
        if vin {
            vinSticker.image = UIImage(named: "vin")
        } else {
            vinSticker.image = nil
        }

        if top {
            topSticker.image = UIImage(named: "top")
        } else {
            topSticker.image = nil
        }
        cityLabel.text = city + " •"
        dateLabel.text = date
        lizingPrice.text = "от \(lizing) USD/месяц"
    }

    // MARK: - DELEGATES:

    @objc func tapOnHidden() {
        delegate?.tapOnButtonHide()
    }

    @objc func tapOnBookmark() {
        delegate?.tapOnButtonBookmark()
    }

    // MARK: - LIFECYCLE:

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 380, height: 300)
        collectionView.isScrollEnabled = true
        collectionView.collectionViewLayout = layout
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        helpers()
        configureConstrains()
        configureUI()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        selectionStyle = .none
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - COLLECTION VIEW:

extension CellSearch: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        imageCell.setImage(images[indexPath.row])
        imageCell.onTap = { [self] in
            funcTest()
        }
        return imageCell
    }

    @objc func funcTest() {
        onTap?()
    }
}
