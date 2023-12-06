import UIKit
final class Main: UIViewController {
    
    //MARK: - PROPERTIES:
    private let totalAdvertisementsActionButton = UIButton()
    
    //MARK: - HELPERS:
    private func helpers() {
        view.addSubview(totalAdvertisementsActionButton)
    }
    
    //MARK: - CONFIGURE CONSTRAINS:
    private func configureConstrains() {
        totalAdvertisementsActionButton.translatesAutoresizingMaskIntoConstraints = false
        totalAdvertisementsActionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        totalAdvertisementsActionButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        totalAdvertisementsActionButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        totalAdvertisementsActionButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
    }
    
    //MARK: - CONFIGURE UI:
    private func configureUI() {
        view.backgroundColor = .backgroundView
        totalAdvertisementsActionButton.backgroundColor = .vin
        totalAdvertisementsActionButton.layer.cornerRadius = 10
        totalAdvertisementsActionButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium, width: .standard)
        totalAdvertisementsActionButton.setTitle("Показать все объявления", for: .normal)
        totalAdvertisementsActionButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    //MARK: - LIFECYCLE:
    override func viewDidLoad() {
        super.viewDidLoad()
        helpers()
        configureConstrains()
        configureUI()
    }
    
    @objc func tapButton() {
        let searchViewController = Search()
        navigationController?.pushViewController(searchViewController, animated: true)
    }
 
}
