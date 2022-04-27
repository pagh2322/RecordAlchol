//
//  LastDrinkRecordList.swift
//  RecordAlchol
//
//  Created by peo on 2022/04/27.
//

import SwiftUI

struct LastDrinkRecordList: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            LastDrinkRecordItem(month: 3, numberOfBeer: 4, numberOfSoju: 2, price: 24000)
                .padding(.vertical, 15)
            LastDrinkRecordItem(month: 2, numberOfBeer: 14, numberOfSoju: 12, price: 104000)
        }
    }
}
