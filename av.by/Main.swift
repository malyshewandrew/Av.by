import UIKit
final class Main: UIViewController {
    // MARK: - PROPERTIES:

    
    private let avbyLabel = UILabel()
    private let imageCar = UIImageView()
    private let totalAdvertisementsButton = UIButton()
    private let vinCheck = UIImageView()
    private let pictureOne = UIImageView()
    private let pictureTwo = UIImageView()
    
    // MARK: - HELPERS:

    private func helpers() {
        view.addSubviews(avbyLabel, imageCar, totalAdvertisementsButton, vinCheck, pictureOne, pictureTwo)
    }
    
    // MARK: - CONFIGURE CONSTRAINS:

    private func configureConstrains() {
        
        // MARK: - AVBY LABEL:
        
        avbyLabel.translatesAutoresizingMaskIntoConstraints = false
        avbyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        avbyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        avbyLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        avbyLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        //MARK: - CAR IMAGE:
        
        imageCar.translatesAutoresizingMaskIntoConstraints = false
        imageCar.topAnchor.constraint(equalTo: avbyLabel.bottomAnchor, constant: 10).isActive = true
        imageCar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageCar.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageCar.widthAnchor.constraint(equalToConstant: 370).isActive = true
        
        // MARK: - TOTAL ADVERSTISEMENTS:
        
        totalAdvertisementsButton.translatesAutoresizingMaskIntoConstraints = false
        totalAdvertisementsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        totalAdvertisementsButton.topAnchor.constraint(equalTo: imageCar.bottomAnchor, constant: 20).isActive = true
        totalAdvertisementsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        totalAdvertisementsButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        
        //MARK: - VIN CHECK:
        
        vinCheck.translatesAutoresizingMaskIntoConstraints = false
        vinCheck.topAnchor.constraint(equalTo: totalAdvertisementsButton.bottomAnchor, constant: 30).isActive = true
        vinCheck.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        vinCheck.heightAnchor.constraint(equalToConstant: 150).isActive = true
        vinCheck.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        
        //MARK: - PICTURE ONE:
        
        pictureOne.translatesAutoresizingMaskIntoConstraints = false
        pictureOne.topAnchor.constraint(equalTo: vinCheck.bottomAnchor, constant: 30).isActive = true
        pictureOne.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -5).isActive = true
        pictureOne.heightAnchor.constraint(equalToConstant: 250).isActive = true
        pictureOne.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.465).isActive = true
        
        //MARK: - PICTURE TWO:
        
        pictureTwo.translatesAutoresizingMaskIntoConstraints = false
        pictureTwo.topAnchor.constraint(equalTo: vinCheck.bottomAnchor, constant: 30).isActive = true
        pictureTwo.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 5).isActive = true
        pictureTwo.heightAnchor.constraint(equalToConstant: 250).isActive = true
        pictureTwo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.465).isActive = true
    }
    
    // MARK: - CONFIGURE UI:

    private func configureUI() {
        
        // MARK: - VIEW:
        
        view.backgroundColor = .backgroundView
        
        // MARK: - AVBY LABEL:
        avbyLabel.text = "AV.BY"
        avbyLabel.textAlignment = .center
        avbyLabel.textColor = .mainText
        avbyLabel.font = .systemFont(ofSize: 22, weight: .bold, width: .standard)
        
        //MARK: - CAR IMAGE:
        
        imageCar.image = UIImage(named: "main")
        
        // MARK: - TOTAL ADVERSTISEMENTS:
        
        totalAdvertisementsButton.backgroundColor = .vin
        totalAdvertisementsButton.layer.cornerRadius = 10
        totalAdvertisementsButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium, width: .standard)
        totalAdvertisementsButton.setTitle("Показать \(arrayCars.count) объявлений", for: .normal)
        totalAdvertisementsButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        //MARK: - VIN CHECK:
        
        vinCheck.image = UIImage(named: "vinCheck")
        vinCheck.clipsToBounds = true
        vinCheck.layer.cornerRadius = 10
        
        //MARK: - PICTURE ONE:
        
        pictureOne.image = UIImage(named: "pictureOne")
        pictureOne.clipsToBounds = true
        pictureOne.layer.cornerRadius = 10
        
        //MARK: - PICTURE TWO:
        
        pictureTwo.image = UIImage(named: "pictureTwo")
        pictureTwo.clipsToBounds = true
        pictureTwo.layer.cornerRadius = 10
    }
    
    @objc private func tapButton() {
        let searchViewController = Search()
        navigationController?.pushViewController(searchViewController, animated: true)
    }
    
    // MARK: - LIFECYCLE:

    override func viewDidLoad() {
        super.viewDidLoad()
        helpers()
        configureConstrains()
        configureUI()
        navigationController?.navigationBar.isHidden = true
        navigationItem.backButtonTitle = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
}
