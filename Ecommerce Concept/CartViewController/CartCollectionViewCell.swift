import UIKit

class CartCollectionViewCell: UICollectionViewCell {
    private var quantity: Double = 1
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
    
    @IBAction func decrementProductButton(_ sender: Any) {
        quantity += 1
    }
    
    @IBAction func incrementProductButton(_ sender: Any) {
        quantity -= 1
    }
    
    func setupCell(image: UIImage, productName: String, amountPrice: Double) {
        productQuantityLabel.text = String(quantity)
        productNameLabel.text = productName
        productImageView.image = image
        quantityView.layer.cornerRadius = 10
        deleteButtonView.image = UIImage(named: "Bucket")
        plusQuantityButton.setImage(UIImage(named: "Plus"), for: .normal)
        minusQuantityButton.setImage(UIImage(named: "Minus"), for: .normal)
        productAmountPriceLabel.text = "$" + " " + String(amountPrice * quantity)
    }
}
