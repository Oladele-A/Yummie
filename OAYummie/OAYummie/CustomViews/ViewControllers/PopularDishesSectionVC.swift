//
//  PopularDishesSectionVC.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 10/24/22.
//

import UIKit

class PopularDishesSectionVC: SectionVC {

    var popularDishes:[Dish] = []
    
    init(frame:CGRect, popularDishes:[Dish]){
        super.init(frame: frame)
        self.popularDishes = popularDishes
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionLabel.text = "Popular Dishes"
        configureCollectionView(with: frame)
    }
    
    override func configureCollectionView(with frame: CGRect) {
        collectionView = UICollectionView(frame: frame, collectionViewLayout: UICollectionViewFlowLayout.createPopularDishesFlowLayout(with: frame))
        view.addSubview(collectionView)
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.dataSource = self
        collectionView.register(PopularDishesCell.self, forCellWithReuseIdentifier: PopularDishesCell.reuseId)
    }
    
}

extension PopularDishesSectionVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularDishes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularDishesCell.reuseId, for: indexPath) as! PopularDishesCell
        cell.setUp(dish: popularDishes[indexPath.item])
        return cell
    }
    
    
}
