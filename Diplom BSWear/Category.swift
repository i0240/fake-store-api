import Foundation
import Alamofire
import RealmSwift

struct FakestoreapiCOMProduct: Decodable, Hashable {
    static func == (lhs: FakestoreapiCOMProduct, rhs: FakestoreapiCOMProduct) -> Bool {
        return lhs.id == rhs.id && lhs.titles == rhs.titles && lhs.price == rhs.price && lhs.description == rhs.description && lhs.category == rhs.category && lhs.image == rhs.image && lhs.rating == rhs.rating
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(titles)
        hasher.combine(price)
        hasher.combine(description)
        hasher.combine(category)
        hasher.combine(image)
        hasher.combine(rating)
    }
    
    let id : Int?
    let titles : String?
    let price : Double?
    let description : String?
    let category : String?
    let image : String?
    let rating : Rating?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case titles = "title"
        case price = "price"
        case description = "description"
        case category = "category"
        case image = "image"
        case rating = "rating"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        titles = try values.decodeIfPresent(String.self, forKey: .titles)
        price = try values.decodeIfPresent(Double.self, forKey: .price)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        rating = try values.decodeIfPresent(Rating.self, forKey: .rating)
    }
}

struct Rating: Decodable, Equatable, Hashable {
    let rate : Double?
    let count : Int?

    enum CodingKeys: String, CodingKey {

        case rate
        case count
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rate = try values.decodeIfPresent(Double.self, forKey: .rate)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
    }
}

class SelectedProduct: Object{
    @objc dynamic var productName = ""
    @objc dynamic var productImage = ""
    @objc dynamic var productPrice = 0.0
}

