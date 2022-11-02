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
    
    var categories:[DishCategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        title = "Yummie"
        ConfigureScrollView()
        layoutUI()
        configureStackView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let categoryFrame = getCollectionViewFrame(from: foodCategoryContainer)
        print(categoryFrame)
        let popularFrame = getCollectionViewFrame(from: popularDishesContainer)
        print(popularFrame)
        let specialsFrame = getCollectionViewFrame(from: chefsSpecialsContainer)
        print(specialsFrame)
        
        showLoadingView()
        NetworkManager.shared.fetchAllCategories { [weak self] result in
            guard let self = self else { return }
            
            self.dismissLoadingView()
            switch result {
                
            case .success(let allCategories):
                self.categories = allCategories.data.categories
                self.add(childVC: FoodCatSectionVC(frame: categoryFrame, foodCategory: self.categories, delegate: self), to: self.foodCategoryContainer)
                let popularDishes = allCategories.data.populars
                self.add(childVC: PopularDishesSectionVC(frame: popularFrame, popularDishes: popularDishes), to: self.popularDishesContainer)
                let chefSpecials = allCategories.data.specials
                self.add(childVC: ChefSpecialsSectionVC(frame: specialsFrame, chefSpecials: chefSpecials), to: self.chefsSpecialsContainer)
            case .failure(let error):
                print(error.rawValue)
            }
        }
        

    }
    
    func add(childVC: UIViewController, to containerView:UIView){
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    func getCollectionViewFrame(from container: UIView)-> CGRect{
        let xCordinate = container.bounds.origin.x
        let yCordinate = container.bounds.origin.y + 16 + 24
        let width = container.bounds.size.width
        let height = container.bounds.size.height - 16 - 24
        let collectionFrame = CGRect(x: xCordinate, y: yCordinate, width: width, height: height)
        return collectionFrame
    }
    
    func ConfigureScrollView(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        
        
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

extension HomeVC: FoodCatSectionVCDelegate{
    
    func didSelectCell(cell: DishCategory) {
        let destVC = ListDishesVC()
        destVC.title = "List"
        present(destVC, animated: true)
    }
}


