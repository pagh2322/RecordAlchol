//
//  RecentRecordList.swift
//  RecordAlchol
//
//  Created by peo on 2022/04/27.
//

import SwiftUI

struct RecentRecordList: View {
    var space: CGFloat = 10
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("2022.04.26")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Divider()
                .padding(.top, 10)
            
            RecentRecordItem(alchol: .beer, name: "칭따오", number: 2, price: 12000)
                .padding(.top, 10)
            RecentRecordItem(alchol: .soju, name: "진로", number: 1, price: 4000)
                .padding(.top, self.space)
            
            Text("2022.04.25")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.top, 20)
            Divider()
                .padding(.top, 10)
            
            RecentRecordItem(alchol: .soju, name: "참이슬", number: 6, price: 24000)
                .padding(.top, 10)
        }
    }
}
