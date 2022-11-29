//
//  PlaceOrder.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 11/25/22.
//

import Foundation

struct PlaceOrder: Codable{
    let status: Int
    let message: String
    let data: Order
}
