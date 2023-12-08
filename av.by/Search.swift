import UIKit
final class Search: UIViewController {
    // MARK: - PRIVATE PROPERTIES:

    private let arrowsButton = UIBarButtonItem()
    private let tableView = UITableView()
    private let buttonView = UIView()
    private let searchButton = UIButton()
    private let parametrsButton = UIButton()
    private var isViewHidden = false

    // MARK: - HELPERS:

    private func helpers() {
        view.addSubviews(tableView, buttonView)
        buttonView.addSubviews(searchButton, parametrsButton)
    }

    // MARK: - CONFIGURE CONSTRAINS:

    private func configureConstrains() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        // MARK: - BUTTON VIEW:

        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -145).isActive = true
        buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        buttonView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.55).isActive = true

        // MARK: - SEARCH BUTTON:

        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 0).isActive = true
        searchButton.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: 0).isActive = true
        searchButton.heightAnchor.constraint(equalTo: buttonView.heightAnchor, multiplier: 1).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: 70).isActive = true

        // MARK: - PARAMETRS BUTTON:

        parametrsButton.translatesAutoresizingMaskIntoConstraints = false
        parametrsButton.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 0).isActive = true
        parametrsButton.leadingAnchor.constraint(equalTo: searchButton.trailingAnchor, constant: 5).isActive = true
        parametrsButton.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor, constant: 0).isActive = true
        parametrsButton.heightAnchor.constraint(equalTo: buttonView.heightAnchor, multiplier: 1).isActive = true
    }

    // MARK: - CONFIGURE UI:

    private func configureUI() {
        // MARK: - NAVIGATION CONTROLLER:

        arrowsButton.image = UIImage(systemName: "arrow.up.arrow.down")
        navigationItem.rightBarButtonItem = arrowsButton

        // MARK: - VIEW:

        view.backgroundColor = .backgroundTabBar

        // MARK: - TABLE VIEW:

        tableView.backgroundColor = .backgroundView

        // MARK: - NAVIGATION CONTROLLER:

        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.backgroundColor = .backgroundTabBar

        // MARK: - VIEW:

        // MARK: - SEARCH BUTTON:

        searchButton.backgroundColor = .systemBlue
        searchButton.layer.cornerRadius = 15
        searchButton.setImage(UIImage(systemName: "text.magnifyingglass"), for: .normal)
        searchButton.tintColor = .white

        // MARK: - PARAMETRS BUTTON:

        parametrsButton.backgroundColor = .systemBlue
        parametrsButton.layer.cornerRadius = 10
        parametrsButton.setImage(UIImage(systemName: "list.triangle"), for: .normal)
        parametrsButton.tintColor = .white
        parametrsButton.setTitle(" Параметры", for: .normal)
        parametrsButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium, width: .standard)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        helpers()
        configureConstrains()
        configureUI()
        title = "\(arrayCars.count) объявлений"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(CellSearch.self, forCellReuseIdentifier: "CellSearch")
    }
}

// MARK: - EXTENSION FOR TABLE VIEW:

extension Search: UITableViewDelegate, UITableViewDataSource {
    // MARK: CUSTOM CELL:

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellSearch", for: indexPath) as? CellSearch else { return UITableViewCell() }
        let car = arrayCars[indexPath.row]
        cell.configure(name: car.name, price: car.price, dollar: car.dollar, photos: car.photos, year: car.year, typeTransmission: car.typeTransmission, sizeEngine: car.sizeEngine, typeEngine: car.typeEngine, typeBody: car.typeBody, odometr: car.odometer, powerReserve: car.power, wheelDrive: car.wheelDrive, color: car.color, registartion: car.registration, power: car.power, fuelFlow: car.fuelFlow, vin: car.vin, top: car.top, city: car.city, date: car.date, vinNumber: car.vinNumber, description: car.description, change: car.change, lizing: car.lizing)
        return cell
    }

    // MARK: COUNT OF ROWS:

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayCars.count
    }

    // MARK: - SCROLLING HIDE AND SHOW VIEW BUTTONS SEARCH AND PARAMETRS:

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        let hideThreshold: CGFloat = 50
        if yOffset > hideThreshold && !isViewHidden {
            UIView.animate(withDuration: 0.3) {
                self.buttonView.alpha = 0.0
            }
            isViewHidden = true
        } else if scrollView.contentOffset.y <= 0 && isViewHidden {
            UIView.animate(withDuration: 0.3) {
                self.buttonView.alpha = 1.0
            }
            isViewHidden = false
        }
    }
}
