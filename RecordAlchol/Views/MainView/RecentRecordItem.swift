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
                .foregroundColor(self.alchol == .beer ? Color(red: 176/255, green: 94/255, blue: 39/255) : Color(red: 48/255, green: 170/255, blue: 221/255))
            
            Text(self.name)
            
            Text("\(self.number)병")
                .bold()
            
            Spacer()
            
            Text("\(self.price)원")
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}
