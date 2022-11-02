//
//  FoodCategoryCell.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 9/26/22.
//

import UIKit

class FoodCategoryCell: RootCollectionViewCell {
    static let reuseId = "FoodCategoryCell"
    
    let imageView = foodImageView(frame: .zero)
    let categoryTitleLabel = OACellLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(category: DishCategory){
        categoryTitleLabel.text = category.name
        imageView.downloadFoodImage(fromURL: category.image)
    }
    
    func configure(){
        
        addSubview(imageView)
        addSubview(categoryTitleLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            imageView.widthAnchor.constraint(equalToConstant: 40),
            imageView.heightAnchor.constraint(equalToConstant: 40),
            
            categoryTitleLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            categoryTitleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            categoryTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            categoryTitleLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
}
