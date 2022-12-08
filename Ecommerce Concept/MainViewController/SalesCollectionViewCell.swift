//
//  SalesCollectionViewCell.swift
//  Ecommerce Concept
//
//  Created by  Oleg Ponomarev on 05.12.2022.
//

import UIKit

class SalesCollectionViewCell: UICollectionViewCell {
    private let projectColors = ProjectColors()
    @IBOutlet private var statusRedView: UIView!
    @IBOutlet private var statusLabel: UILabel!
    @IBOutlet private var phoneNameLabel: UILabel!
    @IBOutlet private var phoneAdNameLabel: UILabel!
    @IBOutlet private var phoneImageView: UIImageView!
    @IBOutlet private var buyButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(phoneName: String, desctiption: String, image: UIImage) {
        statusRedView.backgroundColor = projectColors.redColor
        statusRedView.layer.cornerRadius = statusRedView.frame.width / 2
        buyButton.setTitleColor(.black, for: .normal)
        phoneNameLabel.text = phoneName
        phoneAdNameLabel.text = desctiption
        phoneImageView.image = image
    }
}
