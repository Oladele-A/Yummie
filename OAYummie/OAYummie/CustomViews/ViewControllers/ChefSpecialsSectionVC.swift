//
//  ChefSpecialsSectionVC.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 10/26/22.
//

import UIKit

class ChefSpecialsSectionVC: SectionVC {
    var chefSpecials:[Dish] = []
    
    init(frame: CGRect, chefSpecials:[Dish]){
        super.init(frame: frame)
        self.chefSpecials = chefSpecials
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionLabel.text = "Chef's Specials"
        configureCollectionView(with: frame)
    }
    
    override func configureCollectionView(with frame: CGRect) {
        collectionView = UICollectionView(frame: frame, collectionViewLayout: UICollectionViewFlowLayout.createChefSpecialsFlowLayout(with: frame))
        view.addSubview(collectionView)
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.dataSource = self
        collectionView.register(ChefSpecialsCell.self, forCellWithReuseIdentifier: ChefSpecialsCell.reuseId)
    }
}

extension ChefSpecialsSectionVC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chefSpecials.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefSpecialsCell.reuseId, for: indexPath) as! ChefSpecialsCell
        cell.setUp(dish: chefSpecials[indexPath.item])
        return cell
    }
}
