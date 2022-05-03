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
    
    @Published var currentMonthForDetailView = 4 {
        didSet {
            self.detailCurrentMonthRecord = self.recordList[self.currentMonthForDetailView - 1]
            self.detailCurrentMonthBeerRecord = self.detailCurrentMonthRecord.beerList
            self.detailCurrentMonthSojuRecord = self.detailCurrentMonthRecord.sojuList
            self.numberOfDetailCurrentMonthBeerRecord = self.detailCurrentMonthRecord.numberOfBeer
            self.numberOfDetailCurrentMonthSojuRecord = self.detailCurrentMonthRecord.numberOfSoju
            var price = 0
            for record in self.detailCurrentMonthBeerRecord {
                price += record.price
            }
            self.priceOfDetailCurrentMonthBeerRecord = price
            var price2 = 0
            for record in self.detailCurrentMonthSojuRecord {
                price2 += record.price
            }
            self.priceOfDetailCurrentMonthSojuRecord = price2
        }
    }
    
    var mainCurrentMonthRecord: MonthData {
        get {
            return self.recordList[self.currentMonth - 1]
        }
    }
    
    var mainCurrentMonthRecordList: [AlcholListData] {
        get {
            let firstRecordList = self.mainCurrentMonthRecord.beerList.map { (record) -> AlcholListData in
                var result = record
                result.alchol = .beer
                return result
            }
            let secondRecordList = self.mainCurrentMonthRecord.sojuList.map { (record) -> AlcholListData in
                var result = record
                result.alchol = .soju
                return result
            }
            let result = firstRecordList + secondRecordList
            return result.sorted(by: { firstRecord, secondRecord in
                return firstRecord.date > secondRecord.date
            })
        }
    }
    
    var mainCurrentMonthBeerRecord: [AlcholListData] {
        get {
            return self.mainCurrentMonthRecord.beerList
        }
    }
    
    var mainCurrentMonthSojuRecord: [AlcholListData] {
        get {
            return self.mainCurrentMonthRecord.sojuList
        }
    }
    
    var numberOfMainCurrentMonthBeerRecord: Int {
        get {
            return self.mainCurrentMonthRecord.numberOfBeer
        }
    }
    
    var numberOfMainCurrentMonthSojuRecord: Int {
        get {
            return self.mainCurrentMonthRecord.numberOfSoju
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
    var lastMonthsRocord: [[Int]] {
        get {
            var result = [[Int]](repeating: [0, 0, 0], count: self.currentMonth - 1)
            for month in 0..<self.currentMonth-1 {
                result[month][0] = self.recordList[month].numberOfBeer
                result[month][1] = self.recordList[month].numberOfSoju
                result[month][2] = self.recordList[month].totalPrice
            }
            return result
        }
    }
    
    @Published var detailCurrentMonthRecord: MonthData = MonthData(month: -1, totalPrice: -1, numberOfBeer: -1, numberOfSoju: -1, beerList: [], sojuList: [])
    
    @Published var detailCurrentMonthBeerRecord: [AlcholListData] = []
    
    @Published var detailCurrentMonthSojuRecord: [AlcholListData] = []
    
    @Published var numberOfDetailCurrentMonthBeerRecord: Int = -1
    
    @Published var numberOfDetailCurrentMonthSojuRecord: Int = -1
    
    @Published var priceOfDetailCurrentMonthBeerRecord: Int = -1
    
    @Published var priceOfDetailCurrentMonthSojuRecord: Int = -1
    
    func update() {
        self.detailCurrentMonthRecord = self.recordList[self.currentMonthForDetailView - 1]
        self.detailCurrentMonthBeerRecord = self.detailCurrentMonthRecord.beerList
        self.detailCurrentMonthSojuRecord = self.detailCurrentMonthRecord.sojuList
        self.numberOfDetailCurrentMonthBeerRecord = self.detailCurrentMonthRecord.numberOfBeer
        self.numberOfDetailCurrentMonthSojuRecord = self.detailCurrentMonthRecord.numberOfSoju
        var price = 0
        for record in self.detailCurrentMonthBeerRecord {
            price += record.price
        }
        self.priceOfDetailCurrentMonthBeerRecord = price
        var price2 = 0
        for record in self.detailCurrentMonthSojuRecord {
            price2 += record.price
        }
        self.priceOfDetailCurrentMonthSojuRecord = price2
    }
    
    func checkHasSameDay(index: Int) -> Bool {
//        var result = false
//        self.mainCurrentMonthRecordList.forEach { record in
//            if record.date == date {
//                result = true
//            }
//        }
        if index != 0 {
            return self.mainCurrentMonthRecordList[index - 1].date == self.mainCurrentMonthRecordList[index].date
        }
        return false
    }
}
