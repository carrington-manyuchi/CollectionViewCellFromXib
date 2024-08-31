//
//  UIVIewExt.swift
//  CollectionViewCellFromXib
//
//  Created by Manyuchi, Carrington C on 2024/08/31.
//

import UIKit

extension UIView {
    
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
}
