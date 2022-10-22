import Foundation
import Alamofire

class CategoryLoader{
    func loadCategories(_ id: String, completion: @escaping ([FakestoreapiCOMProduct]) -> Void){
        struct DecodableType: Decodable { let url: String }
        AF.request("https://fakestoreapi.com/products/").responseDecodable(of: [FakestoreapiCOMProduct].self) { (response) in
                switch response.result {
                case .success(let value):
                    completion(value)
                    if ((response.result) != nil) {
                        let jsonData = response.data
//                        print(jsonData as Any)
                        do{
                            let decoder = JSONDecoder()
                            let jsonDict = try decoder.decode([FakestoreapiCOMProduct].self, from: jsonData!)
//                            print(jsonDict)
                        }catch {
                            print("Error: \(error)")
                        }
                    }
                case .failure(let error):

                    print(error)
                }
        }
    }
}
