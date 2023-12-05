import Foundation
import UIKit

// MARK: - STRUCTURE FOR NEW CAR:

struct Car {
    var name: String
    var price: Int
    var dollar: Double {
        return Double(price / 3)
    }
    var photos: [UIImage]
    var year: Int
    var typeTransmission: TypeTransmission
    var sizeEngine: Double
    var typeEngine: TypeEngine
    var typeBody: TypeBody
    var odometer: Int
    var powerReserve: Int
    
    
    var wheelDrive: TypeWheelDrive
    var color: String
    var registration: StatusRegistration
    var power: Int
    var fuelFlow: Double
    
    
    var vin: Bool
    var top: Bool
    var city: String
    var vinNumber: Int
    var description: String
    var complectation: String
    var change: String
    var lizing: Double {
        return Double(Double(price / 3) * 1.3)
    }
    var seller: String
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
