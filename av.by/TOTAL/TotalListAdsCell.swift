import UIKit

final class TotalListAdsCell: UITableViewCell {
    // MARK: - PRIVATE PROPERTIES:

    // MARK: - VIEW:

    private let view = UIView()
    private let nameLabel = UILabel()
    private let hideButton = UIButton()
    private let bookmarkButton = UIButton()
    private let priceBynLabel = UILabel()
    private let priceBynSymbolLabel = UILabel()
    private let priceUsdLabel = UILabel()

    private var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())

    private let descriptionView = UIView()
    private let descriptionLabel = UILabel()

    private let stackView = UIStackView()

    private var topSticker = UIImageView()
    private var vinSticker = UIImageView()
    private var videoSticker = UIImageView()

    private let cityLabel = UILabel()
    private let dateLabel = UILabel()

    private let lineView = UIView()

    private let lizingButton = UIButton()
    private let lizingLable = UILabel()
    private let lizingPrice = UILabel()

    private var car: Car?

    private var images = [UIImage]()
    
    private func offStickers() {
        // MARK: CITY LABEL:

        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 12).isActive = true
        cityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        cityLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true

        // MARK: DATE LABEL:

        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 12).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: cityLabel.trailingAnchor, constant: 2).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }
    
    private func onStickers() {
        // MARK: CITY LABEL:

        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 12).isActive = true
        cityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        cityLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true

        // MARK: DATE LABEL:

        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 12).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: cityLabel.trailingAnchor, constant: 2).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }
    
    // MARK: - CLOSURES:
    
    var funcHideButton: (() -> ())?
    var funcBookmarkButton: (() -> ())?
    var funcLizingkButton: (() -> ())?

    // MARK: - LIFECYCLE:

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 380, height: 300)
        collectionView.isScrollEnabled = true
        collectionView.collectionViewLayout = layout
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        configureConstrains()
        configureUI()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TotalListAdsCollectionViewCell.self, forCellWithReuseIdentifier: "TotalListAdsCollectionViewCell")
        selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - ADD SUBVIEWS:

    func addSubviews() {
        // MARK: - VIEW:

        contentView.addSubviews(view)
        view.addSubviews(nameLabel, hideButton, bookmarkButton, priceBynLabel, priceBynSymbolLabel, priceUsdLabel, collectionView, descriptionView, stackView, cityLabel, dateLabel, lineView, lizingButton)
        descriptionView.addSubviews(descriptionLabel)
        stackView.addArrangedSubviews(topSticker, vinSticker, videoSticker)
        lizingButton.addSubviews(lizingLable, lizingPrice)
    }

    // MARK: - CONFIGURE CONSTRAINS:

    func configureConstrains() {
        // MARK: VIEW:

        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true

        // MARK: NAME LABEL:

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true

        // MARK: HIDE BUTTON:

        hideButton.translatesAutoresizingMaskIntoConstraints = false
        hideButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        hideButton.trailingAnchor.constraint(equalTo: bookmarkButton.leadingAnchor, constant: -20).isActive = true
        hideButton.heightAnchor.constraint(equalTo: nameLabel.heightAnchor, multiplier: 1.2).isActive = true
        hideButton.widthAnchor.constraint(equalTo: nameLabel.heightAnchor, multiplier: 1.5).isActive = true

        // MARK: BOOKMARK BUTTON:

        bookmarkButton.translatesAutoresizingMaskIntoConstraints = false
        bookmarkButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        bookmarkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        bookmarkButton.heightAnchor.constraint(equalTo: nameLabel.heightAnchor, multiplier: 1.2).isActive = true
        bookmarkButton.widthAnchor.constraint(equalTo: nameLabel.heightAnchor, multiplier: 1.2).isActive = true

        // MARK: PRICE BYN LABEL:

        priceBynLabel.translatesAutoresizingMaskIntoConstraints = false
        priceBynLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4).isActive = true
        priceBynLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        priceBynLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true

        // MARK: PRICE BYN SYMBOL LABEL:

        priceBynSymbolLabel.translatesAutoresizingMaskIntoConstraints = false
        priceBynSymbolLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4).isActive = true
        priceBynSymbolLabel.leadingAnchor.constraint(equalTo: priceBynLabel.trailingAnchor, constant: 5).isActive = true
        priceBynSymbolLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true

        // MARK: PRICE USD LABEL:

        priceUsdLabel.translatesAutoresizingMaskIntoConstraints = false
        priceUsdLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 7).isActive = true
        priceUsdLabel.leadingAnchor.constraint(equalTo: priceBynSymbolLabel.trailingAnchor, constant: 10).isActive = true
        priceUsdLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        priceUsdLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true

        // MARK: COLLECTION VIEW:

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: priceBynLabel.bottomAnchor, constant: 8).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.97).isActive = true

        // MARK: DESCRIPTION VIEW:

        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 15).isActive = true
        descriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        descriptionView.heightAnchor.constraint(greaterThanOrEqualTo: descriptionLabel.heightAnchor, constant: 10).isActive = true
        descriptionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true

        // MARK: DESCRIPTION LABEL:

        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 0).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true

        // MARK: STACK VIEW:

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 20).isActive = true

        // MARK: TOP STICKER:

        topSticker.heightAnchor.constraint(equalToConstant: 20).isActive = true
        topSticker.widthAnchor.constraint(equalToConstant: 50).isActive = true
        topSticker.contentMode = .scaleAspectFit

        // MARK: VIN STICKER:

        vinSticker.heightAnchor.constraint(equalToConstant: 20).isActive = true
        vinSticker.widthAnchor.constraint(equalToConstant: 50).isActive = true
        vinSticker.contentMode = .scaleAspectFit

        // MARK: VIDEO STICKER:

        videoSticker.heightAnchor.constraint(equalToConstant: 20).isActive = true
        videoSticker.widthAnchor.constraint(equalToConstant: 50).isActive = true
        videoSticker.contentMode = .scaleAspectFit

        // MARK: LINE VIEW:

        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 18).isActive = true
        lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 0.3).isActive = true
        lineView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.99).isActive = true

        // MARK: LIZING BUTTON:

        lizingButton.translatesAutoresizingMaskIntoConstraints = false
        lizingButton.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 15).isActive = true
        lizingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        lizingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        lizingButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

        // MARK: LIZING LABEL:

        lizingLable.translatesAutoresizingMaskIntoConstraints = false
        lizingLable.topAnchor.constraint(equalTo: lizingButton.topAnchor, constant: 1).isActive = true
        lizingLable.leadingAnchor.constraint(equalTo: lizingButton.leadingAnchor, constant: 10).isActive = true
        lizingLable.heightAnchor.constraint(equalToConstant: 15).isActive = true
        lizingLable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true

        // MARK: LIZING PRICE:

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

        // MARK: VIEW:

        view.backgroundColor = .backgroundCell
        view.layer.cornerRadius = 10

        // MARK: NAME LABEL:

        nameLabel.font = .systemFont(ofSize: 18, weight: .medium, width: .standard)

        // MARK: HIDE BUTTON:

        hideButton.setImage(UIImage(named: "hide"), for: .normal)
        hideButton.addTarget(self, action: #selector(tapOnHideButton), for: .touchUpInside)

        // MARK: BOOKMARK BUTTON:

        bookmarkButton.setImage(UIImage(named: "bookmark"), for: .normal)
        bookmarkButton.addTarget(self, action: #selector(tapOnBookmarkButton), for: .touchUpInside)

        // MARK: PRICE BYN LABEL:

        priceBynLabel.adjustsFontSizeToFitWidth = true
        priceBynLabel.font = .systemFont(ofSize: 26, weight: .black, width: .standard)

        // MARK: PRICE BYN SYMBOL LABEL:

        priceBynSymbolLabel.adjustsFontSizeToFitWidth = true
        priceBynSymbolLabel.font = .systemFont(ofSize: 16, weight: .bold, width: .standard)
        priceBynSymbolLabel.text = "р."

        // MARK: PRICE USD LABEL:

        priceUsdLabel.adjustsFontSizeToFitWidth = true
        priceUsdLabel.textColor = .gray
        priceUsdLabel.font = .systemFont(ofSize: 14, weight: .regular, width: .standard)

        // MARK: COLLECTION VIEW:

        collectionView.layer.cornerRadius = 5
        collectionView.backgroundColor = .clear

        // MARK: DESCRIPTION LABEL:

        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 15, weight: .regular, width: .standard)

        // MARK: STACK VIEW:

        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.spacing = 5

        // MARK: STICKERS:

        topSticker.isHidden = true
        topSticker.image = UIImage(named: "top")
        
        vinSticker.isHidden = true
        vinSticker.image = UIImage(named: "vin")
        
        videoSticker.isHidden = true
        videoSticker.image = UIImage(named: "video")

        // MARK: CITY LABEL:

        cityLabel.adjustsFontSizeToFitWidth = true
        cityLabel.textColor = .systemGray
        cityLabel.font = .systemFont(ofSize: 14, weight: .regular, width: .standard)

        // MARK: DATE LABEL:

        dateLabel.adjustsFontSizeToFitWidth = true
        dateLabel.textColor = .systemGray
        dateLabel.font = .systemFont(ofSize: 12, weight: .regular, width: .standard)

        // MARK: LINE VIEW:

        lineView.backgroundColor = .gray

        // MARK: LIZING BUTTON:

        lizingButton.addTarget(self, action: #selector(tapOnLizingButton), for: .touchUpInside)

        // MARK: LIZING LABEL:

        lizingLable.textColor = .lizingText
        lizingLable.font = .systemFont(ofSize: 14, weight: .regular, width: .standard)
        lizingLable.text = "Лизинг"

        // MARK: LIZING PRICE:

        lizingPrice.textColor = .lizingText
        lizingPrice.font = .systemFont(ofSize: 14, weight: .regular, width: .standard)
    }

    // MARK: - CONFIGURE:

    func configure(car: Car) {
        nameLabel.text = car.name
        priceBynLabel.text = String(car.price)
        priceUsdLabel.text = "≈ \(car.dollar) $"
        images = car.photos
        descriptionLabel.text = "\(car.year)г., \(car.typeTransmission.rawValue), \(car.sizeEngine), \(car.typeEngine.rawValue), \(car.typeBody.rawValue), \(car.odometer) км."

        if car.top == true {
            topSticker.isHidden = false
        }

        if car.vin == true {
            vinSticker.isHidden = false
        }

        if car.video == true {
            videoSticker.isHidden = false
        }

        if car.top == false && car.vin == false && car.video == false {
            stackView.isHidden = false
            offStickers()
        } else {
            onStickers()
        }

        cityLabel.text = car.city + " •"
        dateLabel.text = car.date
        let attributedString = NSMutableAttributedString(string: "от \(car.lizing) USD/месяц")
        if let range = attributedString.string.range(of: "\(car.lizing) USD") {
            let nsRange = NSRange(range, in: attributedString.string)
            attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 14), range: nsRange)
        }
        lizingPrice.attributedText = attributedString
        collectionView.reloadData()
    }

    // MARK: - CLOSURES:

    @objc private func tapOnHideButton() {
        funcHideButton?()
    }

    @objc private func tapOnBookmarkButton() {
        funcBookmarkButton?()
    }

    @objc private func tapOnLizingButton() {
        funcLizingkButton?()
    }
}

// MARK: - COLLECTION VIEW:

extension TotalListAdsCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TotalListAdsCollectionViewCell", for: indexPath) as? TotalListAdsCollectionViewCell else { return UICollectionViewCell() }
        imageCell.setImage(images[indexPath.row])
        imageCell.onTap = {
            print("Tap")
        }
        return imageCell
    }
}
