import UIKit

class MainViewController: UIViewController {
    private var viewModel = ViewModel()
    private var projectColors = ProjectColors()
    private var categoryViewModel = CategoryViewModel()
    @IBOutlet private var categoryCollectionView: UICollectionView!
    @IBOutlet private var salesCollectionView: UICollectionView!
    @IBOutlet private var hotOffersCollectionView: UICollectionView!
    @IBOutlet private var explorerStatusView: UIView!
    @IBOutlet private var explorerBarView: UIView!
    @IBOutlet private var myCartButton: UIButton!
    @IBOutlet private var favouritesButton: UIButton!
    @IBOutlet private var accountButton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupExplorerBarUI()
        setupColletions()
    }
}

extension MainViewController {
    func setupExplorerBarUI() {
        explorerStatusView.layer.cornerRadius = explorerStatusView.frame.width / 2
        explorerBarView.layer.cornerRadius = explorerBarView.frame.height / 2
        myCartButton.setImage(UIImage(named: "Bag"), for: .normal)
        favouritesButton.setImage(UIImage(named: "Heart"), for: .normal)
        accountButton.setImage(UIImage(named: "Human"), for: .normal)
        accountButton.setTitleColor(UIColor.gray, for: UIControl.State.highlighted)
    }
    
    func setupUI() {
        self.view.backgroundColor = projectColors.backGround
        categoryCollectionView.backgroundColor = projectColors.backGround
        salesCollectionView.backgroundColor = projectColors.backGround
        hotOffersCollectionView.backgroundColor = projectColors.backGround
        explorerBarView.backgroundColor = projectColors.darkColor
    }
    
    func setupColletions() {
        self.categoryCollectionView.dataSource = self
        self.categoryCollectionView.delegate = self
        self.categoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        
        self.salesCollectionView.dataSource = self
        self.salesCollectionView.delegate = self
        self.salesCollectionView.register(UINib(nibName: "SalesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SalesCollectionViewCell")
        
        self.hotOffersCollectionView.dataSource = self
        self.hotOffersCollectionView.delegate = self
        self.hotOffersCollectionView.register(UINib(nibName: "BestSellerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BestSellerCollectionViewCell")
    }
}


extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categoryViewModel.category.count
        case salesCollectionView:
            return viewModel.shopBook.bestSales.count
        case hotOffersCollectionView:
            return viewModel.shopBook.hotOffers.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = categoryCollectionView.dequeueReusableCell(
                withReuseIdentifier: "CategoryCollectionViewCell",
                for: indexPath
            ) as! CategoryCollectionViewCell
            
            cell.backgroundColor = projectColors.backGround
            cell.setup(category: categoryViewModel.category[indexPath.item])
            return cell
            
        case salesCollectionView:
            let cell = salesCollectionView.dequeueReusableCell(
                withReuseIdentifier: "SalesCollectionViewCell",
                for: indexPath
            ) as! SalesCollectionViewCell
            
            cell.backgroundColor = projectColors.darkColor
            cell.setup(
                phoneName: viewModel.shopBook.bestSales[indexPath.item].title,
                desctiption: viewModel.shopBook.bestSales[indexPath.item].subtitle,
                image: UIImage(named: "Bag")!) // допилить
            return cell
            
        case hotOffersCollectionView:
            let cell = hotOffersCollectionView.dequeueReusableCell(
                withReuseIdentifier: "BestSellerCollectionViewCell",
                for: indexPath
            ) as! BestSellerCollectionViewCell
            
            cell.backgroundColor = projectColors.backGround
            cell.setup(
                price: String(viewModel.shopBook.hotOffers[indexPath.item].discountPrice),
                previosPrice: String(viewModel.shopBook.hotOffers[indexPath.item].noDiscountPrice),
                phoneName: viewModel.shopBook.hotOffers[indexPath.item].title,
                phoneImage: UIImage(named: "Bag")!) // допилить
            return cell
            
        default: return UICollectionViewCell()
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case categoryCollectionView:
            return CGSize(width: 91, height: 100)
        case salesCollectionView:
            return CGSize(width: 378, height: 182)
        case hotOffersCollectionView:
            return CGSize(width: 181, height: 227)
        default: return CGSize(width: 71, height: 71)
        }

    }
}
