//
//  ContentView.swift
//  RecordAlchol
//
//  Created by peo on 2022/04/27.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("이번 달에 마신 양")
                        .font(.title)
                        .bold()
                        .padding(.top, 44)
                        .padding(.horizontal, 25)
                    
                    HStack {
                        NavigationLink(destination: DetailView(alchol: .beer, number: 5, price: 20000, month: 4)) {
                            MonthlyDrinkItem(alchol: .beer, number: 5, price: 20000)
                                .foregroundColor(.primary)
                        }
                        Spacer()
                        NavigationLink(destination: DetailView(alchol: .soju, number: 18, price: 72000, month: 4)) {
                            MonthlyDrinkItem(alchol: .soju, number: 18, price: 72000)
                                .foregroundColor(.primary)
                        }
                    }
                    .padding(.top, 15)
                    .padding(.horizontal, 25)
                    
                    Rectangle()
                        .fill(Color(UIColor.systemGroupedBackground))
                        .frame(width: UIScreen.main.bounds.width, height: 15)
                        .padding(.top, 30)
                    
                    Text("최근 기록들")
                        .font(.title)
                        .bold()
                        .padding(.top, 30)
                        .padding(.horizontal, 25)
                    
                    RecentRecordList()
                        .padding(.top, 10)
                        .padding(.horizontal, 25)
                    
                    Rectangle()
                        .fill(Color(UIColor.systemGroupedBackground))
                        .frame(width: UIScreen.main.bounds.width, height: 15)
                        .padding(.top, 30)
                    
                    Text("지난 달에 마신 양")
                        .font(.title)
                        .bold()
                        .padding(.top, 30)
                        .padding(.horizontal, 25)
                    
                    LastDrinkRecordList()
                        .padding(.top, 10)
                        .padding(.horizontal, 25)
                }
            }
            .navigationBarHidden(true)
            .padding(.top, 1)
        }
    }
}
