//
//  PopularDishesCell.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 10/24/22.
//

import UIKit

class PopularDishesCell: RootCollectionViewCell {
    static let reuseId = "PopularDishesCell"
    
    let stackView = UIStackView()
    
    let titleLabel = OATitleLabel(textAlignment: .natural, fontSize: 17)
    let imageView = foodImageView(frame: .zero)
    let caloriesLabel = OADescriptionLabel(textAlignment: .natural, textColor: UIColor(red: 0.88, green: 0.23, blue: 0, alpha: 1), fontSize: 12)
    let descriptionLabel = OADescriptionLabel(textAlignment: .natural, textColor: .darkGray, fontSize: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUp(dish:Dish){
        titleLabel.text = dish.name
        imageView.downloadFoodImage(fromURL: dish.image)
        caloriesLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
    }
    
    private func configure(){
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func configureStackView(){
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(caloriesLabel)
        stackView.addArrangedSubview(descriptionLabel)
    }
}
