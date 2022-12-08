import Foundation

class ViewModel {
    var dataLoader = DataLoader()
    var shopBook = ShopBook()
    
    init() {
        dataLoader.dataLoad { [weak self] shopBook in
            guard let self = self else { return }
            self.shopBook = shopBook
        }
    }
}
