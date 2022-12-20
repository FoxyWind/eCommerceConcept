import UIKit

class CartViewController: UIViewController {
    @IBOutlet var addAddressView: UIView!
    @IBOutlet var addAddressImageView: UIImageView!
    @IBOutlet var backButtonView: UIView!
    @IBOutlet var cartCollectionView: UIView!
    @IBOutlet var backButtonImageView: UIImageView!
    @IBOutlet var cartInfoView: UIView!
    @IBOutlet var cartView: UIView!
    @IBOutlet var totalAmountLabel: UILabel!
    @IBOutlet var deliveryAmountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        cartView.layer.cornerRadius = 25
        cartCollectionView.layer.cornerRadius = 25
        backButtonImageView.image = UIImage(named: "Back")
        addAddressImageView.image = UIImage(named: "Location")
        cartInfoView.layer.borderWidth = 1
        cartInfoView.layer.borderColor = UIColor.gray.cgColor
    }


}
