//
//  Order.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 11/25/22.
//

import Foundation

struct Order: Codable{
    let id: String
    let name: String
    let dish: Dish
}
