import Foundation

class DataBaseManager {
    static let shared = DataBaseManager()
    var cartDictionary: [PhoneDetails : Int] = [:]
}
