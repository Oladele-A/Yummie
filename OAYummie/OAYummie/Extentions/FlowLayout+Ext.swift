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
    
    static func createTwoRowFlowLayout(with frame:CGRect) -> UICollectionViewFlowLayout{
        let height = frame.height
        let width = frame.width
        
        let minimumItemSpacing:CGFloat = 10
        let padding: CGFloat = 10
        
        let availableHeight = (height - minimumItemSpacing)
        let availableWidth = (width - (minimumItemSpacing * 2) - (padding * 2))
        let itemHeight = availableHeight/2
        let itemWidth = availableWidth/2.5
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        flowlayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        flowlayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        
        return flowlayout
    }
    
    static func createPopularDishesFlowLayout(with frame: CGRect) -> UICollectionViewFlowLayout{
        let height = frame.height
        let width = frame.width
        
        let minimumItemSpacing:CGFloat = 10
        let padding: CGFloat = 10
        
        let availableHeight = height
        let availableWidth = width - minimumItemSpacing - padding
        
        let itemheight = availableHeight
        let itemwidth = availableWidth / 2.2
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        flowlayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        flowlayout.itemSize = CGSize(width: itemwidth, height: itemheight)
        
        return flowlayout
    }
    
    static func createChefSpecialsFlowLayout(with frame: CGRect) -> UICollectionViewFlowLayout{
        let height = frame.height
        let width = frame.width
        
        let minimumItemSpacing:CGFloat = 10
        let padding: CGFloat = 10
        
        let availableHeight = height
        let availableWidth = width - minimumItemSpacing - padding
        
        let itemheight = availableHeight
        let itemwidth = availableWidth / 1.2
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        flowlayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        flowlayout.itemSize = CGSize(width: itemwidth, height: itemheight)
        
        return flowlayout
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
