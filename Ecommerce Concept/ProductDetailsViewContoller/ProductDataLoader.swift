import Foundation

class ProductDataLoader: ProductDataProtocol {
    func dataLoad(completion: @escaping (PhoneDetails) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5")
        else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let phoneDetails = try JSONDecoder().decode(PhoneDetails.self, from: data)
                    
                    completion(phoneDetails)
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}

protocol ProductDataProtocol {
    func dataLoad(completion: @escaping (PhoneDetails) -> Void)
}
