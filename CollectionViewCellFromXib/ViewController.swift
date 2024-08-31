//
//  ViewController.swift
//  CollectionViewCellFromXib
//
//  Created by Manyuchi, Carrington C on 2024/08/31.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myPageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let productCollectionViewCellId = "ProductCollectionViewCell"
    var products = [ProductDto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNibs()
        myPageControl.currentPage = 0
        myPageControl.numberOfPages = products.count
    }
    
    func setupNibs() {
        
        //registerCell
        let nibCell = UINib(nibName: productCollectionViewCellId, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: productCollectionViewCellId)
        
        
        // init data
        for _ in 1...25 {
            let product = ProductDto()
            product?.name = "Wireless Headphone"
            product?.desc = "Hear the music, not the noise"
            products.append(product!)
        }
        collectionView.reloadData()
    }
    
}
    //code for collectionView
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
        return CGSize(width: UIScreen.main.bounds.width, height:80)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        print("\(indexPath.row) -- \(product.name!)")
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        myPageControl.currentPage = indexPath.row
    }
    

}

