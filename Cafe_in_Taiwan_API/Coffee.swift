//
//  Coffee.swift
//  Cafe_in_Taiwan_API
//
//  Created by Cooper on 2020/10/21.
//

import Foundation

struct CoffeeResult: Codable {
    let resultCount: Int
    let results: [Coffee]
}

//原本的API資料
struct Coffee: Codable {
    let name: String
    let city: String
    let cheap: Double
    let address: String
    let wifi: Double
    let socket: String
    let open_time: String
    let limited_time: String
    let url: String?
}


















