import UIKit

class BestSellerCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var backGroundView: UIView!
    @IBOutlet private var phoneImageView: UIImageView!
    @IBOutlet private var priceLabel: UILabel!
    @IBOutlet private var previosPriceLabel: UILabel!
    @IBOutlet private var phoneNameLabel: UILabel!
    
    
    func setup(price: String, previosPrice: String, phoneName: String, phoneImage: UIImage) {
        backGroundView.layer.cornerRadius = 10
        phoneImageView.layer.cornerRadius = 10
        priceLabel.text = price
        previosPriceLabel.text = previosPrice
        phoneNameLabel.text = phoneName
        phoneImageView.image = phoneImage
    }
}
