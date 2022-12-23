import Foundation
import UIKit

struct PhoneDetails: Decodable, Hashable {
    var cpu: String?
    var camera: String?
    var capacity: [String]?
    var color: [String]?
    var id: String?
    var images: [String]?
    var isFavorites: Bool?
    var price: Double?
    var rating: Double?
    var sd: String?
    var ssd: String?
    var title: String?
    
    enum CodingKeys: String, CodingKey {
        case cpu = "CPU"
        case camera
        case capacity
        case color
        case id
        case images
        case isFavorites
        case price
        case rating
        case sd
        case ssd
        case title
    }
}

