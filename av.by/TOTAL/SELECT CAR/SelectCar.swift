import UIKit

final class SelectCar: UIViewController {
    // MARK: - PROPERTIES:
    
    var car: Car?
    private let tableView = UITableView()
    private let phoneButton = UIButton()
    private let messageButon = UIButton()
    
    // MARK: - LIFECYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstrains()
        configureUI()
        configureTableView()
        tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - ADD SUBVIEWS:

    private func addSubviews() {
        view.addSubviews(tableView, phoneButton, messageButon)
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SelectCarCell.self, forCellReuseIdentifier: "SelectCarCell")
    }
    
    // MARK: - CONFIGURE CONSTRAINS:

    private func configureConstrains() {
        // MARK: TABLE VIEW:
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // MARK: PHONE BUTTON:
        
        phoneButton.translatesAutoresizingMaskIntoConstraints = false
        phoneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        phoneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        phoneButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        phoneButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.73).isActive = true
        
        // MARK: MESSAGE BUTTON:
        
        messageButon.translatesAutoresizingMaskIntoConstraints = false
        messageButon.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        messageButon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        messageButon.heightAnchor.constraint(equalToConstant: 55).isActive = true
        messageButon.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2).isActive = true
    }
    
    // MARK: - CONFIGURE UI:

    private func configureUI() {
        // MARK: VIEW:
        view.backgroundColor = .backgroundView
        let ellipsisButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(tapOnEllipsisButton))
        navigationItem.rightBarButtonItem = ellipsisButton
        title = car?.name
        
        // MARK: - TABLE VIEW:
        
        tableView.backgroundColor = .backgroundTabBar
        tableView.separatorStyle = .none

        // MARK: PHONE BUTTON:
        
        phoneButton.backgroundColor = .vin
        phoneButton.setTitle("Позвонить...", for: .normal)
        phoneButton.layer.cornerRadius = 10
        phoneButton.addTarget(self, action: #selector(tapOnPhone), for: .touchUpInside)
        
        // MARK: MESSAGE BUTTON:
        
        messageButon.backgroundColor = .vin
        messageButon.setImage(UIImage(systemName: "text.bubble"), for: .normal)
        messageButon.tintColor = .white
        messageButon.layer.cornerRadius = 10
        messageButon.addTarget(self, action: #selector(tapOnMessage), for: .touchUpInside)
        
    }
    
    // MARK: - FUNC FOR BUTTONS:
    @objc func tapOnPhone() {
        print("Нажата кнопка Позвонить")
    }
    
    @objc func tapOnMessage() {
        print("Нажата кнопка Написать")
    }
    
    // MARK: FUNCTION FOR ARROWS BUTTON (ALERT):
    
    @objc func tapOnEllipsisButton() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Поделиться...", style: .default))
        alert.addAction(UIAlertAction(title: "Добавить комменатрий...", style: .default))
        alert.addAction(UIAlertAction(title: "В закладки", style: .default))
        alert.addAction(UIAlertAction(title: "Пожаловаться...", style: .destructive))
        alert.addAction(UIAlertAction(title: "Отменить", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
}

extension SelectCar: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelectCarCell", for: indexPath) as? SelectCarCell else { return UITableViewCell() }
        cell.delegate = self
        guard let car = car else { return cell }
        cell.configure(car: car)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        1700
    }
}


extension SelectCar: CellCarTableViewCellDelegate {
    func tapOnButtonShare() {
        print("Нажата кнопка Поделиться")
    }
    
    func tapOnButtonComment() {
        print("Нажата кнопка Комментировать")
    }
    
    func tapOnButtonBookmark() {
        print("Нажата кнопка Добавить в закладки")
    }
    
    func tapOnButtonLizing() {
        print("Нажата кнопка Лизинг")
    }
    
    func tapOnButtonComplain() {
        print("Нажата кнопка Пожаловаться")
    }
    
}
