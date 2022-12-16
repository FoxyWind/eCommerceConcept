import UIKit

class FilterViewController: UIViewController {
    private var projectColors = ProjectColors()
    @IBOutlet var xButtonView: UIButton!
    @IBOutlet var doneButton: UIButton!
    var delegate: FilterViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    @IBAction func doneButton(_ sender: Any) {
        delegate?.closeView(sender: self)
    }
    
    func setup() {
        doneButton.backgroundColor = projectColors.redColor
        xButtonView.layer.cornerRadius = 10
        xButtonView.setImage(UIImage(named: "xButton"), for: .normal)
    }
}

protocol FilterViewDelegate {
    func closeView(sender: FilterViewController)
}
