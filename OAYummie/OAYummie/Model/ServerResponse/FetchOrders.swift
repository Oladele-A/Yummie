//
//  FetchOrders.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 11/27/22.
//

import Foundation

struct FetchOrders: Codable{
    let status: Int
    let message: String
    let data: [Order]
}
