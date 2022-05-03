//
//  LastDrinkRecordList.swift
//  RecordAlchol
//
//  Created by peo on 2022/04/27.
//

import SwiftUI

struct LastDrinkRecordList: View {
    @EnvironmentObject var allData: AllData
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ForEach(self.allData.lastMonthsRocord.indices) { index in
                LastDrinkRecordItem(month: self.allData.lastMonthsRocord.count - index, numberOfBeer: self.allData.lastMonthsRocord[self.allData.lastMonthsRocord.count - index - 1][0], numberOfSoju: self.allData.lastMonthsRocord[self.allData.lastMonthsRocord.count - index - 1][1], price: self.allData.lastMonthsRocord[self.allData.lastMonthsRocord.count - index - 1][2])
                    .padding(.bottom, 15)
            }
        }
    }
}
