//
//  FoodCatSectionVC.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 10/19/22.
//

import UIKit

protocol FoodCatSectionVCDelegate: AnyObject{
    func didSelectCell(cell: DishCategory)
}

class FoodCatSectionVC: SectionVC {

    var foodCategory:[DishCategory]!
    
    var delegate: FoodCatSectionVCDelegate!
    
    init(frame:CGRect, foodCategory:[DishCategory], delegate: FoodCatSectionVCDelegate){
        super.init(frame: frame)
        self.foodCategory = foodCategory
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionLabel.text = "Food Category"
        configureCollectionView(with: frame)
    }
    
    override func configureCollectionView(with frame: CGRect) {
        collectionView = UICollectionView(frame: frame, collectionViewLayout: UICollectionViewFlowLayout.createTwoRowFlowLayout(with: frame))
        view.addSubview(collectionView)
        
        collectionView.isUserInteractionEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.register(FoodCategoryCell.self, forCellWithReuseIdentifier: FoodCategoryCell.reuseId)
    }
}

extension FoodCatSectionVC: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCategoryCell.reuseId, for: indexPath) as! FoodCategoryCell
        cell.set(category: foodCategory[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dishCategory = foodCategory[indexPath.item]
        delegate.didSelectCell(cell: dishCategory)
    }
}
