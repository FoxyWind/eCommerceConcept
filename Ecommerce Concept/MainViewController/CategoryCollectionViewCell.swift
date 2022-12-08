import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var categoryNameLabel: UILabel!
    @IBOutlet var categoryButtonView: CustomButton!
    @IBOutlet var categoryButtons: [CustomButton]!
    @IBOutlet private var categoryImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func categoryButtonAction(_ sender: CustomButton) {
        self.categoryButtons.forEach { (button) in
            button.isHighlighted = false
        }
        sender.isHighlighted = true
    }
    
    func setup(category: String) {
        categoryButtonView.layer.cornerRadius = categoryButtonView.frame.height / 2
        categoryNameLabel.text = category
        categoryImageView.image = UIImage(named: category)
    }
}
