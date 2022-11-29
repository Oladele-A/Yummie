//
//  DishList.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 11/23/22.
//

import Foundation

struct DishList: Codable{
    let status: Int
    let message: String
    let data: [Dish]
}
