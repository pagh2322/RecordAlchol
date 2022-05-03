//
//  AlcholListData.swift
//  RecordAlchol
//
//  Created by peo on 2022/04/29.
//

import Foundation

struct AlcholListData: Hashable, Codable {
    var name: String
    var number: Int
    var price: Int
    var date: String
    var alchol: Alchol?
}
