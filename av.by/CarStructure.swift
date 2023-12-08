import Foundation
import UIKit

// MARK: - STRUCTURE FOR NEW CAR:

struct Car {
    let name: String
    let price: Int
    var dollar: Int {
        return price / 3
    }

    let photos: [UIImage]
    let year: Int
    let typeTransmission: TypeTransmission
    let sizeEngine: Double
    let typeEngine: TypeEngine
    let typeBody: TypeBody
    let odometer: Int
    let powerReserve: Int

    let wheelDrive: TypeWheelDrive
    let color: String
    let registration: StatusRegistration
    let power: Int
    let fuelFlow: Double

    let top: Bool
    let vin: Bool

    let city: String
    let date: String
    let vinNumber: Int
    let description: String

    let exterior: [ComplectationExterior]
    let safety: [ComplectationSysytemSafety]
    let comfort: [ComplectationComfort]
    let multimedia: [ComplectationMultimedia]
    
    let change: StatusChange
    var lizing: Int {
        return price / 3 / 48
    }

    let seller: String
}

// MARK: - ENUMS FOR CAR SETTINGS:

enum TypeTransmission: String {
    case manual = "механика"
    case automatic = "автомат"
    case electric = "электро"
    case hybrid = "гибрид"
}

enum TypeEngine: String {
    case gasoline = "бензин"
    case diesel = "дизель"
    case electric = "электро"
    case hybrid = "гибрид"
    case gas = "газ"
}

enum TypeBody: String {
    case sedan = "седан"
    case coupe = "купе"
    case hatchback = "хетчбек"
    case convertible = "кабриолет"
    case pickup = "пикап"
    case wagon = "грузовик"
    case crossover = "джип"
    case minivan = "минивен"
}

enum TypeWheelDrive: String {
    case frontWheelDrive = "передний привод"
    case rearWheelDrive = "задний привод"
    case allWheelDrive = "полный привод"
}

enum StatusRegistration: String {
    case removedRegister = "снят с учета"
    case onRegister = "на учете"
}


enum StatusChange: String {
    case changeOn = "Возможен обмен"
    case changeOff = "Обмен не интересует"
}

// MARK: - COMPLECTATION:
enum ComplectationExterior: String {
    case disk = "Легкосплавные диски"
    case toner = "Тонированные стекла"
    case spoiler = "Спойлер"
}

enum ComplectationSysytemSafety: String {
    case abs = "ABS"
    case esp = "ESP"
    case antiDrift = "Антипробуксовочная"
    case immobilizer = "Иммобилайзер"
    case signalization = "Сигнализация"
}

enum ComplectationComfort: String {
    case autoStart = "Автозапуск двигателя"
    case cruiseControl = "Круиз контроль"
    case multimedia = "Мультимедиа с руля"
    case electro = "Елекропривод сидений "
}

enum ComplectationMultimedia: String {
    case aux = "AUX или iPod"
    case bluetooth = "Bluetooth"
    case cd = "CD и MP3"
    case usb = "USB"
}
