import UIKit

class CartCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var quantityView: UIView!
    @IBOutlet private var deleteButtonView: UIImageView!
    @IBOutlet private var productImageView: UIImageView!
    @IBOutlet private var productNameLabel: UILabel!
    @IBOutlet private var minusQuantityButton: UIButton!
    @IBOutlet private var plusQuantityButton: UIButton!
    @IBOutlet private var productAmountPriceLabel: UILabel!
    @IBOutlet private var productQuantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell(image: UIImage, productName: String, amountPrice: Double) {
        productNameLabel.text = productName
        productImageView.image = image
        quantityView.layer.cornerRadius = 10
        deleteButtonView.image = UIImage(named: "Bucket")
        plusQuantityButton.setImage(UIImage(named: "Plus"), for: .normal)
        minusQuantityButton.setImage(UIImage(named: "Minus"), for: .normal)
    }
}
