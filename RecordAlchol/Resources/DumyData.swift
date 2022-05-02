//
//  DumyData.swift
//  RecordAlchol
//
//  Created by peo on 2022/04/29.
//

import Foundation

final class AllData: ObservableObject {
    @Published var recordList: [MonthData] = load("RecordData.json")
    var currentMonth = 4 // 실제 날짜의 월
    
    @Published var currentMonthForDetailView = 4
    
    var mainCurrentMonthRecord: MonthData {
        get {
            return self.recordList[self.currentMonth]
        }
    }
    
    var mainCurrentMonthBeerRecord: [AlcholListData] {
        get {
            return self.recordList[self.currentMonth - 1].beerList
        }
    }
    
    var mainCurrentMonthSojuRecord: [AlcholListData] {
        get {
            return self.recordList[self.currentMonth].sojuList
        }
    }
    
    var numberOfMainCurrentMonthBeerRecord: Int {
        get {
            return self.mainCurrentMonthBeerRecord.count
        }
    }
    
    var numberOfMainCurrentMonthSojuRecord: Int {
        get {
            return self.mainCurrentMonthSojuRecord.count
        }
    }
    
    var priceOfMainCurrentMonthBeerRecord: Int {
        get {
            var price = 0
            for record in self.mainCurrentMonthBeerRecord {
                price += record.price
            }
            return price
        }
    }
    
    var priceOfMainCurrentMonthSojuRecord: Int {
        get {
            var price = 0
            for record in self.mainCurrentMonthSojuRecord {
                price += record.price
            }
            return price
        }
    }
}
