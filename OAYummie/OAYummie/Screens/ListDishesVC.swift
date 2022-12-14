//
//  ListDishesVC.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 10/29/22.
//

import UIKit

class ListDishesVC: UIViewController {

    let tableView = UITableView()
    
    var category: DishCategory!
    var dishes:[Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        showLoadingView(withLabel: "")
        NetworkManager.shared.fetchCategoryDishes(categoryId: category.id) { [weak self] result in
            guard let self = self else { return }
            self.dismissLoadingView()
            switch result{
                
            case .success( let dishList):
                self.dishes = dishList.data
                self.tableView.reloadData()
            case .failure( let error):
                print(error)
            }
        }
    }

    
    func configureTableView(){
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.rowHeight = 90
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(DishListCell.self, forCellReuseIdentifier: DishListCell.reuseId)
    }
}

extension ListDishesVC: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListCell.reuseId, for: indexPath) as! DishListCell
        cell.setUp(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dish = dishes[indexPath.row]
        let destVC = DishDetailVC()
        destVC.dish = dish
        
        navigationController?.pushViewController(destVC, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
