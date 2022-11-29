//
//  DishListCell.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 11/23/22.
//

import UIKit

class DishListCell: UITableViewCell {
    static let reuseId = "DishListCell"
    
    let imageview = foodImageView(frame: .zero)
    let stackView = UIStackView()
    let dishTitlelabel = OATitleLabel(textAlignment: .natural, fontSize: 17)
    let dishDescriptionLabel = OADescriptionLabel(textAlignment: .natural, textColor: .systemGray, fontSize: 15)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setInitialConfiguration()
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(dish:Dish){
        imageview.downloadFoodImage(fromURL: dish.image)
        dishTitlelabel.text = dish.name
        dishDescriptionLabel.text = dish.description
    }
    
    func set(order:Order){
        imageview.downloadFoodImage(fromURL: order.dish.image)
        dishTitlelabel.text = order.dish.name
        dishDescriptionLabel.text = order.name
    }
    
    private func layoutUI(){
        addSubview(imageview)
        addSubview(stackView)
        
        accessoryType = .disclosureIndicator
        
        NSLayoutConstraint.activate([
            imageview.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageview.heightAnchor.constraint(equalToConstant: 50),
            imageview.widthAnchor.constraint(equalToConstant: 50),
            
            stackView.leadingAnchor.constraint(equalTo: imageview.trailingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: imageview.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: imageview.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        configureStackView()
    }
    
    func configureStackView(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        
        stackView.addArrangedSubview(dishTitlelabel)
        stackView.addArrangedSubview(dishDescriptionLabel)
    }
    
    private func setInitialConfiguration(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 20
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 10
        backgroundColor = .systemBackground
    }
}
