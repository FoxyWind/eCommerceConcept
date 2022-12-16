import Foundation


class PhoneDetailViewModel {
    private let dataLoader = ProductDataLoader()
    var productDetails = PhoneDetails()
    
    func fetchImage(urlString: String) -> Data? {
        guard let url = URL(string: urlString) else { return nil }
        var data: Data?
        do {
            data = try? Data(contentsOf: url)
        }
        return data
    }
    
    init(completion: @escaping () -> ()) {
        dataLoader.dataLoad { [weak self] productDetails in
            guard let self = self else { return }
            self.productDetails = productDetails
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}
