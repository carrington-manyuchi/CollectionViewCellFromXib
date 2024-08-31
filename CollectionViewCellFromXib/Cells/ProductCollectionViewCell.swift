//
//  ProductCollectionViewCell.swift
//  CollectionViewCellFromXib
//
//  Created by Manyuchi, Carrington C on 2024/08/31.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
