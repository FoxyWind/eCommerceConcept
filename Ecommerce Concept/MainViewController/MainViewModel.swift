import Foundation

class MainViewModel {
    var dataLoader = DataLoader()
    var shopBook = ShopBook()
    var cart = [PhoneDetails]()
    
    func fetchImage(urlString: String) -> Data? {
        guard let url = URL(string: urlString) else { return nil }
        var data: Data?
        do {
            data = try? Data(contentsOf: url)
        }
        return data
    }
    
    init(competion: @escaping () -> ()) {
        dataLoader.dataLoad { [weak self] shopBook in
            guard let self = self else { return }
            self.shopBook = shopBook
            DispatchQueue.main.async {
                competion()
            }
        }
    }
}

extension MainViewModel: SendPhoneToCartDelegate {
    func addPhoneToCart(phone: PhoneDetails) {
        cart.append(phone)
    }
}

protocol SendPhoneToCartDelegate {
    func addPhoneToCart(phone: PhoneDetails)
}
