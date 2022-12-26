import Foundation
import UIKit

struct CategoryViewModel {
    var category = ["Camera", "Computer", "Health", "Books", "Computer", "Human"]
}

struct ShopBook: Decodable {
    var bestSales = [SalesOrders]()
    var hotOffers = [HotOffers]()
    
    enum CodingKeys: String, CodingKey {
        case bestSales = "home_store"
        case hotOffers = "best_seller"
    }
}

struct SalesOrders: Decodable {
    var id: Int
    var title: String
    var subtitle: String
    var image: String
    var isNew: Bool?
    var isBuy: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case subtitle
        case image = "picture"
        case isNew = "is_new"
        case isBuy = "is_buy"
    }
}

struct HotOffers: Decodable {
    var id: Int
    var isFavourite: Bool
    var title: String
    var noDiscountPrice: Double
    var discountPrice: Double
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case isFavourite = "is_favorites"
        case noDiscountPrice = "price_without_discount"
        case discountPrice = "discount_price"
        case image = "picture"
    }
}
