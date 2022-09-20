//
//  FlowLayout+Ext.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 9/13/22.
//

import UIKit

extension UICollectionViewFlowLayout{
    
    static func createSingleFlowLayout(in view: UIView) -> UICollectionViewFlowLayout{
        let availableWidth = view.bounds.width
        let itemwidth = availableWidth
        let padding: CGFloat = 10
        let itemheight = view.bounds.height - (2 * padding)
       
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
//        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemwidth, height: itemheight)
        
        return flowLayout
    }
    
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout{
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing:CGFloat = 10
        let availableWidth = (width - (padding * 2) - (minimumItemSpacing * 2))
        let itemWidth = availableWidth / 3
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowlayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowlayout
    }
}
