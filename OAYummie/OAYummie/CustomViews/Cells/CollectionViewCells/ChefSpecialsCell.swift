//
//  ChefSpecialsCell.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 10/26/22.
//

import UIKit

class ChefSpecialsCell: RootCollectionViewCell {
    static let reuseId = "ChefSpecialsCell"
    
    let stackview = UIStackView()
    
    let imageView = foodImageView(frame: .zero)
    let titleLabel = OATitleLabel(textAlignment: .natural, fontSize: 19)
    let descriptionLabel = OADescriptionLabel(textAlignment: .natural, textColor: .darkGray, fontSize: 14)
    let caloriesLabel = OADescriptionLabel(textAlignment: .natural, textColor: UIColor(red: 0.88, green: 0.23, blue: 0, alpha: 1), fontSize: 12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureStackview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(dish: Dish){
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        imageView.downloadFoodImage(fromURL: dish.image)
        caloriesLabel.text = dish.formattedCalories
    }
    
    private func configure(){
        addSubview(imageView)
        addSubview(stackview)
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.heightAnchor.constraint(equalToConstant: 68),
            imageView.widthAnchor.constraint(equalToConstant: 68),
            
            stackview.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            stackview.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            stackview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackview.heightAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }
    
    func configureStackview(){
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .fillEqually
        stackview.spacing = 0
        
        stackview.addArrangedSubview(titleLabel)
        stackview.addArrangedSubview(descriptionLabel)
        stackview.addArrangedSubview(caloriesLabel)
    }
}
