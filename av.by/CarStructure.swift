import Foundation
import UIKit

// MARK: - STRUCTURE FOR NEW CAR:

struct Car {
    let name: String
    var price: Int
    var dollar: Double {
        return Double(price / 3)
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

    var vin: Bool
    var top: Bool

    let city: String
    var date: String
    let vinNumber: Int
    let description: String
    let complectation: String
    let change: String
    var lizing: Double {
        return Double(Double(price / 3) * 1.3)
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
