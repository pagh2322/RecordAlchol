//
//  RecentRecordList.swift
//  RecordAlchol
//
//  Created by peo on 2022/04/27.
//

import SwiftUI

struct RecentRecordList: View {
    var space: CGFloat = 10
    @EnvironmentObject var allData: AllData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if self.allData.mainCurrentMonthRecordList.isEmpty {
                Text("아직 기록이 없습니다")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 15)
            } else {
                ForEach(self.allData.mainCurrentMonthRecordList.indices, id: \.self) { index in
                    if !self.allData.checkHasSameDay(index: index) {
                        Text(self.allData.mainCurrentMonthRecordList[index].date)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Divider()
                            .padding(.top, 10)
                    }
                    
                    
                    RecentRecordItem(alchol: self.allData.mainCurrentMonthRecordList[index].alchol!, name: self.allData.mainCurrentMonthRecordList[index].name, number: self.allData.mainCurrentMonthRecordList[index].number, price: self.allData.mainCurrentMonthRecordList[index].price)
                        .padding(.top, self.allData.checkHasSameDay(index: index) ? 0 : 10)
                        .padding(.bottom, 15)
                }
            }
        }
        .padding(.top, 10)
    }
}
