//
//  LastDrinkRecordItem.swift
//  RecordAlchol
//
//  Created by peo on 2022/04/27.
//

import SwiftUI

struct LastDrinkRecordItem: View {
    var month: Int
    var numberOfBeer: Int
    var numberOfSoju: Int
    var price: Int
    
    var body: some View {
        HStack {
            Text("\(self.month)월")
                .bold()
            
            Text("맥주 \(self.numberOfBeer)병")
                .bold()
                .foregroundColor(Color(red: 176/255, green: 94/255, blue: 39/255))
            
            Text("소주 \(self.numberOfSoju)병")
                .bold()
                .foregroundColor(Color(red: 48/255, green: 170/255, blue: 221/255))
            
            Spacer()
            
            Text("\(self.price)원")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(.white)
        .cornerRadius(6)
        .shadow(radius: 2)
    }
}
