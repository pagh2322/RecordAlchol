//
//  AllRecordList.swift
//  RecordAlchol
//
//  Created by peo on 2022/04/27.
//

import SwiftUI

struct AllRecordList: View {
    var alchol: Alchol
    @EnvironmentObject var allData: AllData
    
    func getMonth(date: String) -> String {
        let startIndex = date.index(date.startIndex, offsetBy: 8)
        return String(date[startIndex ..< date.endIndex])
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(self.alchol == .beer ? self.allData.detailCurrentMonthBeerRecord.indices : self.allData.detailCurrentMonthSojuRecord.indices, id: \.self) { index in
                let record = self.alchol == .beer ? self.allData.detailCurrentMonthBeerRecord[index] : self.allData.detailCurrentMonthSojuRecord[index]
                if !self.allData.checkHasSameDay(index: index, alchol: self.alchol) {
//                    Text("\(String(record.date[record.date.index(record.date.startIndex, offsetBy: 8)...record.date.endIndex]))일")
//                        .font(.subheadline)
//                        .foregroundColor(.secondary)
                    
                    Text("\(self.getMonth(date: record.date))일")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Divider()
                        .padding(.top, 10)
                }
                
                RecentRecordItem(alchol: self.alchol, name: record.name, number: record.number, price: record.price)
                    .padding(.top, self.allData.checkHasSameDay(index: index, alchol: self.alchol) ? 0 : 5)
                    .padding(.bottom, 15)
            }
        }
    }
}
