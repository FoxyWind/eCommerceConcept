import Foundation
import UIKit

class CustomButton: UIButton {
    private let projectColors = ProjectColors()
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? projectColors.redColor : .white
        }
    }
}
