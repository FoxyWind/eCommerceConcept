import UIKit

class CartViewController: UIViewController {
    private var productDetailViewModel: PhoneDetailViewModel?
    @IBOutlet private var addAddressView: UIView!
    @IBOutlet private var addAddressImageView: UIImageView!
    @IBOutlet private var backButtonView: UIView!
    @IBOutlet private var cartCollectionView: UICollectionView!
    @IBOutlet private var backButtonImageView: UIImageView!
    @IBOutlet private var cartInfoView: UIView!
    @IBOutlet private var cartView: UIView!
    @IBOutlet private var checkoutButtonView: UIButton!
    @IBOutlet private var totalAmountLabel: UILabel!
    @IBOutlet private var deliveryAmountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productViewModelInit()
        setupCartCollection()
    }
    
    func productViewModelInit() {
        self.productDetailViewModel = PhoneDetailViewModel(completion: {
            self.cartCollectionView.reloadData()
            self.setupUI()
        })
    }
    
    private func setupUI() {
        cartView.layer.cornerRadius = 25
        cartCollectionView.layer.cornerRadius = 25
        backButtonImageView.image = UIImage(named: "Back")
        addAddressImageView.image = UIImage(named: "Location")
        cartInfoView.layer.borderWidth = 1
        cartInfoView.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setupCartCollection() {
        self.cartCollectionView.delegate = self
        self.cartCollectionView.dataSource = self
        self.cartCollectionView.register(UINib(nibName: "CartCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CartCollectionViewCell")
    }
}

extension CartViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let productDetailViewModel = productDetailViewModel,
              let data = productDetailViewModel.fetchImage(urlString: (productDetailViewModel.productDetails.images?[indexPath.item])!),
              let image = UIImage(data: data),
              let cell = cartCollectionView.dequeueReusableCell(withReuseIdentifier: "CartCollectionViewCell", for: indexPath) as? CartCollectionViewCell
        else { return UICollectionViewCell() }
        
        cell.setupCell(image: image,
                       productName: productDetailViewModel.productDetails.title ?? "Test",
                       amountPrice: productDetailViewModel.productDetails.price ?? 404)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 91)
    }
}
