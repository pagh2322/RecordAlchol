//
//  MonthlyDrinkItem.swift
//  RecordAlchol
//
//  Created by peo on 2022/04/27.
//

import SwiftUI

struct MonthlyDrinkItem: View {
    var alchol: Alchol
    var number: Int
    var price: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.alchol.title)
                .font(.subheadline)
                .foregroundColor(self.alchol == .beer ? Color(red: 176/255, green: 94/255, blue: 39/255) : Color(red: 48/255, green: 170/255, blue: 221/255))
            
            HStack {
                Text("\(self.number)병")
                
                Image(systemName: "chevron.right")
                    .font(.title3)
            }
            .font(.title)
            .padding(.top, 10)
            
            Text("\(self.price)원")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 15)
        .padding(.leading, 15)
//        .padding(.trailing, 65)
        .frame(width: (UIScreen.main.bounds.width - 75) / 2, height: 120, alignment: .leading)
        .background(self.alchol == .beer ? Color(red: 176/255, green: 94/255, blue: 39/255, opacity: 0.3) : Color(red: 48/255, green: 170/255, blue: 221/255, opacity: 0.3))
        .cornerRadius(20)
        .shadow(radius: 4)
    }
}
