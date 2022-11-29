//
//  Dish.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 9/26/22.
//

struct Dish: Codable {
    let id: String
    let name: String
    let description: String
    let image: String
    let calories: Int
    let category: String?
    
    var formattedCalories: String{
        return "\(calories) calories"
    }
}
