//
//  OnboardingCell.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 9/13/22.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    static let reuseID = "OnboardingCell"
    
    let onboardingImage = UIImageView()
    let titleLabel = OATitleLabel(textAlignment: .center, fontSize: 31)
    let descriptionLabel = OADescriptionLabel(textAlignment: .center, textColor: .lightGray, fontSize: 15)
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(slide:OnboardingSlide){
        onboardingImage.image = slide.image
        titleLabel.text = slide.title
        descriptionLabel.text = slide.description
    }
    
    private func configureStackView(){
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        stackView.spacing = 16
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.alignment = .fill
        
        stackView.contentMode = .scaleToFill
    }
    

    
    private func configure(){
        addSubview(onboardingImage)
        addSubview(stackView)
        
        descriptionLabel.numberOfLines = 2
        onboardingImage.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        onboardingImage.contentMode = .scaleAspectFit
        onboardingImage.clipsToBounds = true
        
        
        NSLayoutConstraint.activate([
            onboardingImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            onboardingImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            onboardingImage.topAnchor.constraint(equalTo: topAnchor),
//            onboardingImage.heightAnchor.constraint(equalToConstant: 550),
            
            stackView.topAnchor.constraint(equalTo: onboardingImage.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
