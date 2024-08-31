//
//  ModernView.swift
//  CollectionViewCellFromXib
//
//  Created by Manyuchi, Carrington C on 2024/08/31.
//

import UIKit

class ModernView: UIView {
    
    @IBOutlet weak private var cardView: UIView!
    @IBOutlet weak private var myPageControl: UIPageControl!
    @IBOutlet weak private var collectionView: UICollectionView!
    
    let productCollectionViewCellId = "ProductCollectionViewCell"
    var products = [ProductDto]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    
    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "ModernView") else {
            return
        }
        view.frame = self.bounds
        self.addSubview(view)
    }

    
    
    private func commonInit() {
//        // Load from nib
//        let nib = UINib(nibName: "ModernView", bundle: nil)
//        guard let loadedView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
//            print("Failed to load ModernView nib")
//            return
//        }
//        
//        // Check outlets
//        print("collectionView is \(collectionView)")
//        print("myPageControl is \(myPageControl)")
//
//        // Add loaded view as a subview and match its frame
//        loadedView.frame = self.bounds
        guard let view = self.loadViewFromNib(nibName: "ModernView") else {
            return
        }
        view.frame = self.bounds
        self.addSubview(view)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Set up collection view
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Register cell nib
        setupNibs()
        
        // Initialize page control
        myPageControl.currentPage = 0
        myPageControl.numberOfPages = products.count
    }

    
    func setupNibs() {
        // Register cell
        let nibCell = UINib(nibName: productCollectionViewCellId, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: productCollectionViewCellId)
        
        // Init data
        for _ in 1...25 {
            let product = ProductDto()
            product?.name = "Wireless Headphone"
            product?.desc = "Hear the music, not the noise"
            products.append(product!)
        }
        collectionView.reloadData()
    }
}

// MARK: - UICollectionView Data Source and Delegate
extension ModernView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productCollectionViewCellId, for: indexPath) as? ProductCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let product = products[indexPath.row]
        cell.lbName.text = product.name
        cell.lbDesc.text = product.desc
        cell.img.image = UIImage(named: "one")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 10
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 80)
    }

    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        myPageControl.currentPage = indexPath.row
    }
}
