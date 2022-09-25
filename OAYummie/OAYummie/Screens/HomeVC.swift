//
//  HomeVC.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 9/22/22.
//

import UIKit

class HomeVC: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let stackView = UIStackView()
    let foodCategoryContainer = UIView()
    let popularDishesContainer = UIView()
    let chefsSpecialsContainer = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Yummie"
        ConfigureScrollView()
        layoutUI()
        configureStackView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func ConfigureScrollView(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 686)
        ])
    }
    
    func layoutUI(){
        contentView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
//        foodCategoryContainer.translatesAutoresizingMaskIntoConstraints = false
//        popularDishesContainer.translatesAutoresizingMaskIntoConstraints = false
//        chefsSpecialsContainer.translatesAutoresizingMaskIntoConstraints = false
        
        foodCategoryContainer.backgroundColor = .systemMint
        popularDishesContainer.backgroundColor = .systemBlue
        chefsSpecialsContainer.backgroundColor = .systemRed
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            foodCategoryContainer.heightAnchor.constraint(equalToConstant: 162),
            popularDishesContainer.heightAnchor.constraint(equalToConstant: 340),
            chefsSpecialsContainer.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    func configureStackView(){
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .fill
        stackView.distribution = .fill
        
        stackView.contentMode = .scaleToFill
        
        stackView.addArrangedSubview(foodCategoryContainer)
        stackView.addArrangedSubview(popularDishesContainer)
        stackView.addArrangedSubview(chefsSpecialsContainer)
    }
}
