import UIKit
final class Main: UIViewController {
    // MARK: - PROPERTIES:

    private let totalAdvertisementsButton = UIButton()
    
    // MARK: - HELPERS:

    private func helpers() {
        view.addSubview(totalAdvertisementsButton)
    }
    
    // MARK: - CONFIGURE CONSTRAINS:

    private func configureConstrains() {
        totalAdvertisementsButton.translatesAutoresizingMaskIntoConstraints = false
        totalAdvertisementsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        totalAdvertisementsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        totalAdvertisementsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        totalAdvertisementsButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
    }
    
    // MARK: - CONFIGURE UI:

    private func configureUI() {
        view.backgroundColor = .backgroundView
        totalAdvertisementsButton.backgroundColor = .vin
        totalAdvertisementsButton.layer.cornerRadius = 10
        totalAdvertisementsButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium, width: .standard)
        totalAdvertisementsButton.setTitle("Показать \(arrayCars.count) объявлений", for: .normal)
        totalAdvertisementsButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    @objc func tapButton() {
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
}
