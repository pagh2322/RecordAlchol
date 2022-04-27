//
//  RecentRecordItem.swift
//  RecordAlchol
//
//  Created by peo on 2022/04/27.
//

import SwiftUI

struct RecentRecordItem: View {
    var alchol: Alchol
    var name: String
    var number: Int
    var price: Int
    
    var body: some View {
        HStack {
            Text(self.alchol.title)
                .font(.subheadline)
            
            Text(self.name)
                .bold()
            
            Text("\(self.number)병")
                .bold()
            
            Spacer()
            
            Text("\(self.price)원")
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}
