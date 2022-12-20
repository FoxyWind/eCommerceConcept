import UIKit

class CartViewController: UIViewController {

    @IBOutlet var addAddressView: UIView!
    @IBOutlet var addAddressImageView: UIImageView!
    @IBOutlet var backButtonView: UIView!
    @IBOutlet var backButtonImageView: UIImageView!
    @IBOutlet var cartView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        cartView.layer.cornerRadius = 25
        backButtonImageView.image = UIImage(named: "Back")
        addAddressImageView.image = UIImage(named: "Location")
    }


}
