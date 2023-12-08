import UIKit
final class Search: UIViewController {
    // MARK: - PRIVATE PROPERTIES:

    private let tableView = UITableView()

    // MARK: - HELPERS:

    private func helpers() {
        view.addSubview(tableView)
    }

    // MARK: - CONFIGURE CONSTRAINS:

    private func configureConstrains() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    // MARK: - CONFIGURE UI:

    private func configureUI() {
        view.backgroundColor = .backgroundTabBar
        tableView.backgroundColor = .backgroundView
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.backgroundColor = .backgroundTabBar
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
}
