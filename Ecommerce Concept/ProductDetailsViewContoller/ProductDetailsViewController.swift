import UIKit

class ProductDetailsViewController: UIViewController {
    private var productDetailViewModel: PhoneDetailViewModel?
    private let projectColors = ProjectColors()
    @IBOutlet private var bagButton: UIView!
    @IBOutlet private var bagButtonImage: UIImageView!
    @IBOutlet private var backButton: UIView!
    @IBOutlet private var phoneCollectionView: UICollectionView!
    @IBOutlet private var phoneDescriptionView: UIView!
    @IBOutlet private var favouriteButtonView: UIView!
    @IBOutlet private var favouriteButtonImageView: UIImageView!
    @IBOutlet private var backButtonImageView: UIImageView!
    @IBOutlet private var phoneNameLabel: UILabel!
    @IBOutlet private var starImageCollection: [UIImageView]!
    @IBOutlet private var cpuImageView: UIImageView!
    @IBOutlet private var cpuNameLabel: UILabel!
    @IBOutlet private var cameraImageView: UIImageView!
    @IBOutlet private var firstColorImageView: UIImageView!
    @IBOutlet private var cameraNameLabel: UILabel!
    @IBOutlet private var sdImageView: UIImageView!
    @IBOutlet private var sdNameLabel: UILabel!
    @IBOutlet private var ssdImageView: UIImageView!
    @IBOutlet private var ssdNameLabel: UILabel!
    @IBOutlet private var colorChoiseCollection: [UIView]!
    @IBOutlet private var capacityFirstButtonView: UIView!
    @IBOutlet private var addToCartButton: UIView!
    @IBOutlet private var catalogCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productViewModelInit()
        configure()
        setupCatalogCollection()
    }
    
    func productViewModelInit() {
        self.productDetailViewModel = PhoneDetailViewModel(completion: {
            self.catalogCollectionView.reloadData()
            self.setupUI()
        })
    }
    
    @IBAction func addToCardButton(_ sender: Any) {
        guard let model = productDetailViewModel?.productDetails else { return }
        if let value = DataBaseManager.shared.cartDictionary[model] {
            DataBaseManager.shared.cartDictionary[model] = value + 1
        } else {
            DataBaseManager.shared.cartDictionary[model] = 1
        }
    }
    private func setupCatalogCollection() {
        self.catalogCollectionView.delegate = self
        self.catalogCollectionView.dataSource = self
        self.catalogCollectionView.register(UINib(nibName: "PhoneCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhoneCollectionViewCell")
    }
    
    private func configure() {
        colorChoiseCollection.forEach { UIView in
            UIView.layer.cornerRadius = UIView.frame.width / 2
        }
    }
    
    private func setupUI() {
        guard let productDetailViewModel = productDetailViewModel
        else { return }
        catalogCollectionView.backgroundColor = projectColors.backGround
        view.backgroundColor = projectColors.backGround
        addToCartButton.layer.cornerRadius = 10
        addToCartButton.backgroundColor = projectColors.redColor
        capacityFirstButtonView.layer.cornerRadius = 10
        backButton.layer.cornerRadius = 10
        bagButton.layer.cornerRadius = 10
        backButton.backgroundColor = projectColors.darkColor
        bagButton.backgroundColor = projectColors.redColor
        firstColorImageView.image = UIImage(named: "Yes")
        favouriteButtonImageView.image = UIImage(named: "Heart")
        favouriteButtonView.layer.cornerRadius = 10
        backButtonImageView.image = UIImage(named: "Back")
        bagButtonImage.image = UIImage(named: "Bag")
        phoneDescriptionView.layer.cornerRadius = 10
        phoneDescriptionView.backgroundColor = .white
        cpuImageView.image = UIImage(named: "cpu")
        cameraImageView.image = UIImage(named: "Camera")
        sdImageView.image = UIImage(named: "sd")
        ssdImageView.image = UIImage(named: "ssd")
        cpuNameLabel.text = productDetailViewModel.productDetails.cpu
        cameraNameLabel.text = productDetailViewModel.productDetails.camera
        sdNameLabel.text = productDetailViewModel.productDetails.sd
        ssdNameLabel.text = productDetailViewModel.productDetails.ssd
        phoneNameLabel.text = productDetailViewModel.productDetails.title
        starImageCollection.forEach { UIImageView in
            UIImageView.image = UIImage(named: "Star")
        }
    }
}

extension ProductDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let productDetailViewModel = productDetailViewModel,
              let imagesArray = productDetailViewModel.productDetails.images
        else { return 0 }
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let productDetailViewModel = productDetailViewModel,
              let data = productDetailViewModel.fetchImage(urlString: (productDetailViewModel.productDetails.images?[indexPath.item])!),
              let image = UIImage(data: data)
        else { return UICollectionViewCell() }
        let cell = catalogCollectionView.dequeueReusableCell(withReuseIdentifier: "PhoneCollectionViewCell", for: indexPath) as! PhoneCollectionViewCell
        cell.setup(image: image)
        cell.layer.cornerRadius = 30
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width * 0.75, height: 349)
    }
}
