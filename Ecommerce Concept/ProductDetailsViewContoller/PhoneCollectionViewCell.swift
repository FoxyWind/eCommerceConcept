import UIKit

class PhoneCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var phoneView: UIView!
    @IBOutlet private var phoneImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func setup(image: UIImage) {
        phoneView.layer.cornerRadius = 10
        phoneImageView.image = image
    }
}
