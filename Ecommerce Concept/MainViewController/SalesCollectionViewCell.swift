import UIKit

class SalesCollectionViewCell: UICollectionViewCell {
    private let projectColors = ProjectColors()
    @IBOutlet private var statusRedView: UIView!
    @IBOutlet private var mainView: UIView!
    @IBOutlet private var statusLabel: UILabel!
    @IBOutlet private var phoneNameLabel: UILabel!
    @IBOutlet private var phoneAdNameLabel: UILabel!
    @IBOutlet private var phoneImageView: UIImageView!
    @IBOutlet private var buyButton: UIButton!
    
    func setup(phoneName: String, desctiption: String, image: UIImage, isNew: Bool) {
        phoneImageView.layer.cornerRadius = 20
        statusRedView.backgroundColor = projectColors.redColor
        mainView.layer.cornerRadius = 20
        statusRedView.layer.cornerRadius = statusRedView.frame.width / 2
        buyButton.setTitleColor(.black, for: .normal)
        phoneNameLabel.text = phoneName
        phoneAdNameLabel.text = desctiption
        phoneImageView.image = image
        if isNew == true { statusRedView.isHidden = false }
        else { statusRedView.isHidden = true }
    }
}
