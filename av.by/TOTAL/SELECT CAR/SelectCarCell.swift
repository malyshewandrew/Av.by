import UIKit

protocol CellCarTableViewCellDelegate {
    func tapOnButtonShare()
    func tapOnButtonComment()
    func tapOnButtonBookmark()
    func tapOnButtonLizing()
    func tapOnButtonComplain()
}

final class SelectCarCell: UITableViewCell {
    // MARK: - PROPERTIES:

    private let mainSection = UIView()
    
    private let nameLabel = UILabel()
    private let priceLabel = UILabel()
    private let priceBynSymbolLabel = UILabel()
    private let priceUsdLabel = UILabel()
    
    private var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let lizingView = UIView()
    private let lizingLabel = UILabel()
    private let lizingImage = UIImageView()
    private let lizingButton = UIButton()
    
    private let shareImage = UIImageView()
    private let shareLabel = UILabel()
    private let shareButton = UIButton()
    
    private let commentImage = UIImageView()
    private let commentLabel = UILabel()
    private let commentButton = UIButton()
    
    private let bookmarkImage = UIImageView()
    private let bookmarkLabel = UILabel()
    private let bookmarkButton = UIButton()
    
    private let lineView = UIView()
    
    private let descriptionLabel = UILabel()
    
    private let lineViewTwo = UIView()
    
    private let cityLabel = UILabel()
    private let dateLabel = UILabel()
    
    private let countViewsButton = UIButton()
    
    private let descriptionSection = UIView()
    private let descriptionSectionLabel = UILabel()
    private let descriptionSectionText = UILabel()
    
    private let complectationSection = UIView()
    private let complectationSectionLabel = UILabel()
    private let complectationSectionText = UILabel()
    
    private let changeSection = UIView()
    private let changeSectionLabel = UILabel()
    private let changeSectionText = UILabel()
    
    private let complainButtom = UIButton()
    
    private var images = [UIImage]()
    
    var delegate: CellCarTableViewCellDelegate?
            
    // MARK: - LIFEYCLE:
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 280, height: 300)
        collectionView.isScrollEnabled = true
        collectionView.collectionViewLayout = layout
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        configureConstrains()
        configureUI()
        configureCollectionView()
    }
        
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ADD SUBCIEWS:

    private func addSubviews() {
        contentView.addSubview(mainSection)
        mainSection.addSubviews(nameLabel, priceLabel, priceBynSymbolLabel, priceUsdLabel, collectionView, lizingView, lizingLabel, lizingImage, lizingButton, shareImage, shareLabel, shareButton, commentImage, commentLabel, commentButton, bookmarkImage, bookmarkLabel, bookmarkButton, lineView, descriptionLabel, lineViewTwo, cityLabel, dateLabel, countViewsButton, complainButtom)
        contentView.addSubviews(descriptionSection, descriptionSectionLabel, descriptionSectionText, complectationSection, complectationSectionLabel, complectationSectionText, changeSection, changeSectionLabel, changeSectionText)
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SelectCarCollectionViewCell.self, forCellWithReuseIdentifier: "SelectCarCollectionViewCell")
    }
    
    // MARK: - CONFIGURE CONSTRAINS:

    private func configureConstrains() {
        // MARK: - MAIN SECTION:
        
        mainSection.translatesAutoresizingMaskIntoConstraints = false
        mainSection.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainSection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        mainSection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        mainSection.bottomAnchor.constraint(equalTo: countViewsButton.bottomAnchor, constant: 25).isActive = true
        mainSection.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1).isActive = true

        // MARK: - NAME LABEL:
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: mainSection.topAnchor, constant: 7).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: mainSection.leadingAnchor, constant: 10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: mainSection.widthAnchor, multiplier: 0.9).isActive = true
        
        // MARK: - PRICE LABEL:
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 7).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        // MARK: PRICE BYN SYMBOL LABEL:

        priceBynSymbolLabel.translatesAutoresizingMaskIntoConstraints = false
        priceBynSymbolLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        priceBynSymbolLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 5).isActive = true
        priceBynSymbolLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true

        // MARK: PRICE USD LABEL:

        priceUsdLabel.translatesAutoresizingMaskIntoConstraints = false
        priceUsdLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 7).isActive = true
        priceUsdLabel.leadingAnchor.constraint(equalTo: priceBynSymbolLabel.trailingAnchor, constant: 10).isActive = true
        priceUsdLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        priceUsdLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        // MARK: - COLLECTION VIEW:
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 238).isActive = true
        collectionView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.96).isActive = true
        
        // MARK: - LIZING VIEW:
        
        lizingView.translatesAutoresizingMaskIntoConstraints = false
        lizingView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20).isActive = true
        lizingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        lizingView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        lizingView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.96).isActive = true
        
        // MARK: - LIZING LABEL:
        
        lizingLabel.translatesAutoresizingMaskIntoConstraints = false
        lizingLabel.leadingAnchor.constraint(equalTo: lizingView.leadingAnchor, constant: 10).isActive = true
        lizingLabel.centerYAnchor.constraint(equalTo: lizingView.centerYAnchor).isActive = true
        lizingLabel.heightAnchor.constraint(equalTo: lizingView.heightAnchor, multiplier: 0.75).isActive = true
        lizingLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        // MARK: - LIZING IMAGE:
        
        lizingImage.translatesAutoresizingMaskIntoConstraints = false
        lizingImage.trailingAnchor.constraint(equalTo: lizingView.trailingAnchor, constant: -10).isActive = true
        lizingImage.centerYAnchor.constraint(equalTo: lizingView.centerYAnchor).isActive = true
        lizingImage.heightAnchor.constraint(equalTo: lizingView.heightAnchor, multiplier: 0.70).isActive = true
        lizingImage.widthAnchor.constraint(equalToConstant: 105).isActive = true
        
        // MARK: - LIZING BUTTON:
        
        lizingButton.translatesAutoresizingMaskIntoConstraints = false
        lizingButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10).isActive = true
        lizingButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        lizingButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        lizingButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.96).isActive = true
        
        // MARK: - SHARE IMAGE:
        
        shareImage.translatesAutoresizingMaskIntoConstraints = false
        shareImage.topAnchor.constraint(equalTo: lizingView.bottomAnchor, constant: 25).isActive = true
        shareImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50).isActive = true
        shareImage.heightAnchor.constraint(equalToConstant: 27).isActive = true
        shareImage.widthAnchor.constraint(equalToConstant: 27).isActive = true

        // MARK: - SHARE LABEL:
        
        shareLabel.translatesAutoresizingMaskIntoConstraints = false
        shareLabel.topAnchor.constraint(equalTo: shareImage.bottomAnchor, constant: 5).isActive = true
        shareLabel.centerXAnchor.constraint(equalTo: shareImage.centerXAnchor).isActive = true
        shareLabel.heightAnchor.constraint(equalToConstant: 13).isActive = true
        shareLabel.widthAnchor.constraint(equalToConstant: 75).isActive = true

        // MARK: - SHARE BUTTON:
        
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.topAnchor.constraint(equalTo: lizingView.bottomAnchor, constant: 15).isActive = true
        shareButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        shareButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        // MARK: - COMMENT IMAGE:
        
        commentImage.translatesAutoresizingMaskIntoConstraints = false
        commentImage.topAnchor.constraint(equalTo: lizingView.bottomAnchor, constant: 25).isActive = true
        commentImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        commentImage.heightAnchor.constraint(equalToConstant: 27).isActive = true
        commentImage.widthAnchor.constraint(equalToConstant: 27).isActive = true

        // MARK: - COMMENT LABEL:
        
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.topAnchor.constraint(equalTo: commentImage.bottomAnchor, constant: 5).isActive = true
        commentLabel.centerXAnchor.constraint(equalTo: commentImage.centerXAnchor).isActive = true
        commentLabel.heightAnchor.constraint(equalToConstant: 13).isActive = true
        commentLabel.widthAnchor.constraint(equalToConstant: 85).isActive = true

        // MARK: - COMMENT BUTTON:
        
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        commentButton.topAnchor.constraint(equalTo: lizingView.bottomAnchor, constant: 15).isActive = true
        commentButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        commentButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        commentButton.widthAnchor.constraint(equalToConstant: 60).isActive = true

        // MARK: - BOOKMARK IMAGE:
        
        bookmarkImage.translatesAutoresizingMaskIntoConstraints = false
        bookmarkImage.topAnchor.constraint(equalTo: lizingView.bottomAnchor, constant: 25).isActive = true
        bookmarkImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50).isActive = true
        bookmarkImage.heightAnchor.constraint(equalToConstant: 27).isActive = true
        bookmarkImage.widthAnchor.constraint(equalToConstant: 27).isActive = true

        bookmarkLabel.translatesAutoresizingMaskIntoConstraints = false
        bookmarkLabel.topAnchor.constraint(equalTo: bookmarkImage.bottomAnchor, constant: 5).isActive = true
        bookmarkLabel.centerXAnchor.constraint(equalTo: bookmarkImage.centerXAnchor).isActive = true
        bookmarkLabel.heightAnchor.constraint(equalToConstant: 13).isActive = true
        bookmarkLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        bookmarkButton.translatesAutoresizingMaskIntoConstraints = false
        bookmarkButton.topAnchor.constraint(equalTo: lizingView.bottomAnchor, constant: 15).isActive = true
        bookmarkButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40).isActive = true
        bookmarkButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        bookmarkButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.topAnchor.constraint(equalTo: shareLabel.bottomAnchor, constant: 25).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.90).isActive = true
        
        lineViewTwo.translatesAutoresizingMaskIntoConstraints = false
        lineViewTwo.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 15).isActive = true
        lineViewTwo.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineViewTwo.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1).isActive = true
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.topAnchor.constraint(equalTo: lineViewTwo.bottomAnchor, constant: 10).isActive = true
        cityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        cityLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1).isActive = true
        cityLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 3).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        dateLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        countViewsButton.translatesAutoresizingMaskIntoConstraints = false
        countViewsButton.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10).isActive = true
        countViewsButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        countViewsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        countViewsButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.96).isActive = true
        
        descriptionSection.translatesAutoresizingMaskIntoConstraints = false
        descriptionSection.topAnchor.constraint(equalTo: mainSection.bottomAnchor, constant: 20).isActive = true
        descriptionSection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        descriptionSection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        descriptionSection.heightAnchor.constraint(greaterThanOrEqualTo: descriptionLabel.heightAnchor, constant: 20).isActive = true
        descriptionSection.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1).isActive = true
        
        descriptionSectionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionSectionLabel.topAnchor.constraint(equalTo: descriptionSection.topAnchor, constant: 10).isActive = true
        descriptionSectionLabel.leadingAnchor.constraint(equalTo: descriptionSection.leadingAnchor, constant: 10).isActive = true
        descriptionSectionLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        descriptionSectionLabel.widthAnchor.constraint(equalTo: descriptionSection.widthAnchor, multiplier: 0.5).isActive = true
        
        descriptionSectionText.translatesAutoresizingMaskIntoConstraints = false
        descriptionSectionText.topAnchor.constraint(equalTo: descriptionSectionLabel.bottomAnchor, constant: 10).isActive = true
        descriptionSectionText.leadingAnchor.constraint(equalTo: descriptionSection.leadingAnchor, constant: 10).isActive = true
        descriptionSectionText.heightAnchor.constraint(equalTo: descriptionSection.heightAnchor, multiplier: 0.8).isActive = true
        descriptionSectionText.widthAnchor.constraint(equalTo: descriptionSection.widthAnchor, multiplier: 0.95).isActive = true
        
        complectationSection.translatesAutoresizingMaskIntoConstraints = false
        complectationSection.topAnchor.constraint(equalTo: descriptionSection.bottomAnchor, constant: 20).isActive = true
        complectationSection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        complectationSection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        complectationSection.heightAnchor.constraint(greaterThanOrEqualTo: complectationSectionText.heightAnchor).isActive = true
        complectationSection.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1).isActive = true
        
        complectationSectionLabel.translatesAutoresizingMaskIntoConstraints = false
        complectationSectionLabel.topAnchor.constraint(equalTo: complectationSection.topAnchor, constant: 10).isActive = true
        complectationSectionLabel.leadingAnchor.constraint(equalTo: complectationSection.leadingAnchor, constant: 10).isActive = true
        complectationSectionLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        complectationSectionLabel.widthAnchor.constraint(equalTo: complectationSection.widthAnchor, multiplier: 0.5).isActive = true
        
        complectationSectionText.translatesAutoresizingMaskIntoConstraints = false
        complectationSectionText.topAnchor.constraint(equalTo: complectationSectionLabel.bottomAnchor, constant: 10).isActive = true
        complectationSectionText.leadingAnchor.constraint(equalTo: complectationSection.leadingAnchor, constant: 10).isActive = true
        complectationSectionText.heightAnchor.constraint(equalTo: complectationSection.heightAnchor, multiplier: 0.8).isActive = true
        complectationSectionText.widthAnchor.constraint(equalTo: complectationSection.widthAnchor, multiplier: 0.95).isActive = true
        
        changeSection.translatesAutoresizingMaskIntoConstraints = false
        changeSection.topAnchor.constraint(equalTo: complectationSection.bottomAnchor, constant: 20).isActive = true
        changeSection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        changeSection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        changeSection.heightAnchor.constraint(equalToConstant: 100).isActive = true
        changeSection.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1).isActive = true
        
        changeSectionLabel.translatesAutoresizingMaskIntoConstraints = false
        changeSectionLabel.topAnchor.constraint(equalTo: changeSection.topAnchor, constant: 10).isActive = true
        changeSectionLabel.leadingAnchor.constraint(equalTo: changeSection.leadingAnchor, constant: 10).isActive = true
        changeSectionLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        changeSectionLabel.widthAnchor.constraint(equalTo: changeSection.widthAnchor, multiplier: 0.5).isActive = true
        
        changeSectionText.translatesAutoresizingMaskIntoConstraints = false
        changeSectionText.topAnchor.constraint(equalTo: changeSectionLabel.bottomAnchor, constant: 0).isActive = true
        changeSectionText.leadingAnchor.constraint(equalTo: changeSection.leadingAnchor, constant: 10).isActive = true
        changeSectionText.heightAnchor.constraint(equalTo: changeSection.heightAnchor, multiplier: 0.8).isActive = true
        changeSectionText.widthAnchor.constraint(equalTo: changeSection.widthAnchor, multiplier: 0.95).isActive = true
        
        complainButtom.translatesAutoresizingMaskIntoConstraints = false
        complainButtom.topAnchor.constraint(equalTo: changeSection.bottomAnchor, constant: 30).isActive = true
        complainButtom.centerXAnchor.constraint(equalTo: mainSection.centerXAnchor).isActive = true
        complainButtom.heightAnchor.constraint(equalToConstant: 55).isActive = true
        complainButtom.widthAnchor.constraint(equalTo: mainSection.widthAnchor, multiplier: 0.95).isActive = true
    }
    
    // MARK: - CONFIGURE UI:

    private func configureUI() {
        // MARK: - CONTENT VIEW:
        
        contentView.backgroundColor = .black
        
        // MARK: - MAIN SECTION:

        mainSection.backgroundColor = .backgroundTabBar
        
        // MARK: - COLLECTION VIEW:

        collectionView.layer.cornerRadius = 10
        collectionView.backgroundColor = .clear
        
        // MARK: - NAME LABEL:

        nameLabel.font = .systemFont(ofSize: 18, weight: .regular)
        
        // MARK: - PRICE LABEL:

        priceLabel.font = .systemFont(ofSize: 22, weight: .bold)
        priceLabel.adjustsFontSizeToFitWidth = true
        priceLabel.font = .systemFont(ofSize: 26, weight: .black, width: .standard)

        // MARK: PRICE BYN SYMBOL LABEL:

        priceBynSymbolLabel.adjustsFontSizeToFitWidth = true
        priceBynSymbolLabel.font = .systemFont(ofSize: 16, weight: .bold, width: .standard)
        priceBynSymbolLabel.text = "р."

        // MARK: PRICE USD LABEL:

        priceUsdLabel.adjustsFontSizeToFitWidth = true
        priceUsdLabel.textColor = .gray
        priceUsdLabel.font = .systemFont(ofSize: 14, weight: .regular, width: .standard)
        
        // MARK: - LIZING VIEW:
        
        lizingView.backgroundColor = .lizingView
        lizingView.layer.cornerRadius = 10

        // MARK: - LIZING BUTTON:
        
        lizingButton.backgroundColor = .clear
        lizingButton.addTarget(self, action: #selector(tapOnLizing), for: .touchUpInside)
        
        // MARK: - LIZING LABEL:

        lizingLabel.textColor = .selectItem
        lizingLabel.font = .systemFont(ofSize: 15, weight: .medium, width: .standard)
        lizingLabel.numberOfLines = 0
        
        // MARK: - LIZING IMAGE:

        lizingImage.image = UIImage(named: "belweb")
        lizingImage.layer.cornerRadius = 5
        lizingImage.layer.masksToBounds = true
        
        // MARK: - LINE VIEW:

        lineView.backgroundColor = .darkGray
        lineViewTwo.backgroundColor = .darkGray
        
        // MARK: - SHARE:

        shareImage.image = UIImage(systemName: "square.and.arrow.up")
        shareImage.tintColor = .selectItem
        shareLabel.text = "Поделиться"
        shareLabel.textColor = .selectItem
        shareLabel.font = .systemFont(ofSize: 12, weight: .medium)
        shareButton.addTarget(self, action: #selector(tapOnShare), for: .touchUpInside)
        
        // MARK: - COMMENT:

        commentImage.image = UIImage(systemName: "text.bubble")
        commentImage.tintColor = .selectItem
        commentLabel.text = "Комментарий"
        commentLabel.textColor = .selectItem
        commentLabel.font = .systemFont(ofSize: 12, weight: .medium)
        commentButton.addTarget(self, action: #selector(tapOnComment), for: .touchUpInside)
        
        // MARK: - BOOKMARK IMAGE:

        bookmarkImage.image = UIImage(systemName: "bookmark.square")
        bookmarkImage.tintColor = .selectItem
        bookmarkLabel.text = "В закладки"
        bookmarkLabel.textColor = .selectItem
        bookmarkLabel.font = .systemFont(ofSize: 12, weight: .medium)
        bookmarkButton.addTarget(self, action: #selector(tapOnBookmark), for: .touchUpInside)
        
        // MARK: - CITY LABEL:

        cityLabel.textColor = .gray
        cityLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        // MARK: - DATE LABEL:

        dateLabel.textColor = .gray
        dateLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        // MARK: - COUNT VIEWS BUTTON:

        countViewsButton.backgroundColor = .lizingView
        countViewsButton.layer.cornerRadius = 10
        countViewsButton.setTitleColor(.selectItem, for: .normal)
        countViewsButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        countViewsButton.setTitle("Просмотров " + String(Int.random(in: 1 ... 500)) + " сегодня", for: .normal)
        
        // MARK: - DESCRIPTION:
        
        descriptionSection.backgroundColor = .backgroundTabBar
        descriptionSectionLabel.text = "Описание"
        descriptionSectionLabel.font = .systemFont(ofSize: 22, weight: .bold)
        descriptionLabel.numberOfLines = 0
        descriptionSectionText.numberOfLines = 0
        descriptionSectionText.font = .systemFont(ofSize: 16, weight: .regular, width: .standard)
        descriptionSectionText.textColor = .white
        
        // MARK: - COMPLECTATION:

        complectationSection.backgroundColor = .backgroundTabBar
        complectationSectionLabel.text = "Комплектация"
        complectationSectionLabel.font = .systemFont(ofSize: 22, weight: .bold)
        complectationSectionText.numberOfLines = 0
        
        // MARK: - CHANGE:

        changeSection.backgroundColor = .backgroundTabBar
        changeSectionLabel.text = "Обмен"
        changeSectionLabel.font = .systemFont(ofSize: 22, weight: .bold)
        changeSectionText.numberOfLines = 0
        changeSectionText.font = .systemFont(ofSize: 14, weight: .regular, width: .standard)
        changeSectionText.textColor = .gray
        
        // MARK: - COMPLAIN BUTTON:

        complainButtom.backgroundColor = .complain
        complainButtom.layer.cornerRadius = 10
        complainButtom.setTitle("Пожаловаться", for: .normal)
        complainButtom.addTarget(self, action: #selector(tapOnComplain), for: .touchUpInside)
    }
    
    // MARK: - CONFIGURE:

    func configure(car: Car) {
        nameLabel.text = car.name
        images = car.photos
        priceLabel.text = String(car.price)
        priceUsdLabel.text = "≈ \(car.dollar) $"
        lizingLabel.text = "Лизинг \n\(car.lizing) BYN в месяц"
        descriptionLabel.text = "\(car.year)г., \(car.typeTransmission.rawValue), \(car.sizeEngine), \(car.typeEngine.rawValue), \(car.odometer)км, \(car.typeBody.rawValue), \(car.wheelDrive.rawValue) привод, \(car.color) \n\(car.power) л.с., расход \(car.fuelFlow) л"
        cityLabel.text = car.city
        dateLabel.text = "Опубликовано \(car.date)"
        descriptionSectionText.text = car.description
        changeSectionText.text = "\(car.change.rawValue)."
        complectationSectionText.text = """
        \(car.exterior.map { $0.rawValue }.joined(separator: "\n"))
        
        \(car.multimedia.map { $0.rawValue }.joined(separator: "\n"))
        
        \(car.comfort.map { $0.rawValue }.joined(separator: "\n"))
        
        \(car.safety.map { $0.rawValue }.joined(separator: "\n"))
        """
        collectionView.reloadData()
    }
    
    // MARK: - DELEGATES:

    @objc func tapOnShare() {
        delegate?.tapOnButtonShare()
    }
    
    @objc func tapOnComment() {
        delegate?.tapOnButtonComment()
    }
    
    @objc func tapOnBookmark() {
        delegate?.tapOnButtonBookmark()
    }
    
    @objc func tapOnLizing() {
        delegate?.tapOnButtonLizing()
    }
    
    @objc func tapOnComplain() {
        delegate?.tapOnButtonComplain()
    }
}

// MARK: - COLLECTION VIEW:

extension SelectCarCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectCarCollectionViewCell", for: indexPath) as? SelectCarCollectionViewCell else { return UICollectionViewCell() }
        imageCell.setImage(images[indexPath.row])
        return imageCell
    }
}
