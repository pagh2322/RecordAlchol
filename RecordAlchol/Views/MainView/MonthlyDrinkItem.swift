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
        .padding(.trailing, 65)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .shadow(radius: 2)
    }
}
