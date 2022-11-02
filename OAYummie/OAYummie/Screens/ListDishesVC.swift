//
//  ListDishesVC.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 10/29/22.
//

import UIKit

class ListDishesVC: UIViewController {

    var category: DishCategory!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        print(category)
    }
}
