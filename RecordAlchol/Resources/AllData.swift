//
//  DumyData.swift
//  RecordAlchol
//
//  Created by peo on 2022/04/29.
//

import Foundation

final class AllData: ObservableObject {
    @Published var recordList: [MonthData] = load("RecordData.json")
    var currentMonth = 5 // 실제 날짜의 월
    var currentRecord = AlcholListData(name: "", number: -1, price: -1, date: "")
    
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
            
            self.detailCurrentMonthBeerRecord = self.detailCurrentMonthRecord.beerList.sorted { firstRecord, secondRecord in
                return firstRecord.date > secondRecord.date
            }
            self.detailCurrentMonthSojuRecord = self.detailCurrentMonthRecord.sojuList.sorted { firstRecord, secondRecord in
                return firstRecord.date > secondRecord.date
            }
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
        
        self.detailCurrentMonthBeerRecord = self.detailCurrentMonthRecord.beerList.sorted { firstRecord, secondRecord in
            return firstRecord.date > secondRecord.date
        }
        self.detailCurrentMonthSojuRecord = self.detailCurrentMonthRecord.sojuList.sorted { firstRecord, secondRecord in
            return firstRecord.date > secondRecord.date
        }
    }
    
    func checkHasSameDay(index: Int) -> Bool {
        if index != 0 {
            return self.mainCurrentMonthRecordList[index - 1].date == self.mainCurrentMonthRecordList[index].date
        }
        return false
    }
    
    func checkHasSameDay(index: Int, alchol: Alchol) -> Bool {
        if index != 0 {
            if alchol == .beer {
                return self.detailCurrentMonthBeerRecord[index - 1].date == self.detailCurrentMonthBeerRecord[index].date

            } else {
                return self.detailCurrentMonthSojuRecord[index - 1].date == self.detailCurrentMonthSojuRecord[index].date
            }
        }
        return false
    }
    
    func addRecord() {
        if self.currentRecord.alchol == .beer {
            self.recordList[self.currentMonthForDetailView - 1].beerList.insert(self.currentRecord, at: 0)
            self.recordList[self.currentMonthForDetailView - 1].numberOfBeer += self.currentRecord.number
            self.detailCurrentMonthRecord = self.recordList[self.currentMonthForDetailView - 1]
            self.detailCurrentMonthBeerRecord = self.detailCurrentMonthRecord.beerList
            self.numberOfDetailCurrentMonthBeerRecord = self.detailCurrentMonthRecord.numberOfBeer
            var price = 0
            for record in self.detailCurrentMonthBeerRecord {
                price += record.price
            }
            self.priceOfDetailCurrentMonthBeerRecord = price
            self.detailCurrentMonthBeerRecord = self.detailCurrentMonthRecord.beerList.sorted { firstRecord, secondRecord in
                return firstRecord.date > secondRecord.date
            }
        } else {
            self.recordList[self.currentMonthForDetailView - 1].sojuList.insert(self.currentRecord, at: 0)
            self.recordList[self.currentMonthForDetailView - 1].numberOfSoju += self.currentRecord.number
            self.detailCurrentMonthRecord = self.recordList[self.currentMonthForDetailView - 1]
            self.detailCurrentMonthSojuRecord = self.detailCurrentMonthRecord.sojuList
            self.numberOfDetailCurrentMonthSojuRecord = self.detailCurrentMonthRecord.numberOfSoju
            var price2 = 0
            for record in self.detailCurrentMonthSojuRecord {
                price2 += record.price
            }
            self.priceOfDetailCurrentMonthSojuRecord = price2
            self.detailCurrentMonthSojuRecord = self.detailCurrentMonthRecord.sojuList.sorted { firstRecord, secondRecord in
                return firstRecord.date > secondRecord.date
            }
        }
        self.recordList[self.currentMonthForDetailView - 1].totalPrice += self.currentRecord.price
        save(data: self.recordList)
        self.currentRecord = AlcholListData(name: "", number: -1, price: -1, date: "")
    }
}
