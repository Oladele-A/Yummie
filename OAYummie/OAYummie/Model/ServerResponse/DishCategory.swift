//
//  DishCategory.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 9/26/22.
//

struct DishCategory: Codable{
    let id: String
    let name: String
    let image: String
    
    enum CodingKeys: String, CodingKey{
        case id
        case name = "title"
        case image 
    }
}
