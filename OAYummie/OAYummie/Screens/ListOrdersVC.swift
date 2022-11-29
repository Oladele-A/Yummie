//
//  ListOrdersVC.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 11/27/22.
//

import UIKit

class ListOrdersVC: UIViewController {
    

    let tableView = UITableView()
    var orders:[Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        showLoadingView(withLabel: "")
        NetworkManager.shared.fetchOrders { [weak self] result in
            guard let self = self else { return }
            self.dismissLoadingView()
            switch result{
                
            case .success(let orders):
                self.orders = orders.data
                self.tableView.reloadData()
            case .failure(let error):
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

extension ListOrdersVC: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListCell.reuseId, for: indexPath) as! DishListCell
        cell.set(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dish = orders[indexPath.row].dish
        let destVC = DishDetailVC()
        destVC.dish = dish
        
        navigationController?.pushViewController(destVC, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
