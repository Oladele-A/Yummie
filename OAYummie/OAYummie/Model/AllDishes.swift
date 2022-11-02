//
//  AllDishes.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 9/26/22.
//

struct AllDishes: Codable {
    let categories: [DishCategory]
    let populars: [Dish]
    let specials: [Dish]
}
