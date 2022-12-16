import Foundation

class DataLoader: DataLoaderProtocol {
    func dataLoad(completion: @escaping (ShopBook) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175")
        else { return }
        let request = URLRequest(url: url)
        let task  = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let shopBook = try JSONDecoder().decode(ShopBook.self, from: data)
                    
                        completion(shopBook)
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}

protocol DataLoaderProtocol {
    func dataLoad(completion: @escaping (ShopBook) -> Void)
}
