import UIKit

class FilterViewController: UIViewController {
    private var projectColors = ProjectColors()
    @IBOutlet private var brandTableView: UITableView!
    @IBOutlet private var brandTextField: UITextField!
    @IBOutlet private var priceTableView: UITableView!
    @IBOutlet private var priceTextField: UITextField!
    @IBOutlet private var sizeTableView: UITableView!
    @IBOutlet private var sizeTextField: UITextField!
    @IBOutlet private var xButtonView: UIButton!
    @IBOutlet private var doneButton: UIButton!
    var delegate: FilterViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    @IBAction func doneButton(_ sender: Any) {
        delegate?.closeView(sender: self)
    }
    @IBAction func closeButton(_ sender: Any) {
        delegate?.closeView(sender: self)
    }
    
    func setup() {
        brandTableView.isHidden = true
        priceTableView.isHidden = true
        sizeTableView.isHidden = true
        brandTextField.text = "- - -"
        priceTextField.text = "- - -"
        sizeTextField.text = "- - -"
        doneButton.layer.cornerRadius = 20
        doneButton.backgroundColor = projectColors.redColor
        xButtonView.layer.cornerRadius = 10
        xButtonView.setImage(UIImage(named: "xButton"), for: .normal)
    }
}

protocol FilterViewDelegate {
    func closeView(sender: FilterViewController)
}
