//
//  MonthData.swift
//  RecordAlchol
//
//  Created by peo on 2022/04/29.
//

import Foundation

struct MonthData: Hashable, Codable {
    var month: Int
    var totalPrice: Int
    var numberOfBeer: Int
    var numberOfSoju: Int
    var beerList: [AlcholListData]
    var sojuList: [AlcholListData]
}
