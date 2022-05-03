//
//  ContentView.swift
//  RecordAlchol
//
//  Created by peo on 2022/04/27.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var allData: AllData
    
    @ViewBuilder
    private func TitleText(_ text: String) -> some View {
        Text(text)
            .font(.title2)
            .bold()
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading, spacing: 0) {
                    TitleText("이번 달에 마신 양")
                        .padding(.top, 10)
                        .padding(.horizontal, 25)
                    
                    HStack {
                        NavigationLink(destination: DetailView(alchol: .beer)) {
                            MonthlyDrinkItem(alchol: .beer, number: self.allData.numberOfMainCurrentMonthBeerRecord, price: self.allData.priceOfMainCurrentMonthBeerRecord)
                                .foregroundColor(.primary)
                        }
                        Spacer()
                        NavigationLink(destination: DetailView(alchol: .soju)) {
                            MonthlyDrinkItem(alchol: .soju, number: self.allData.numberOfMainCurrentMonthSojuRecord, price: self.allData.priceOfMainCurrentMonthSojuRecord)
                                .foregroundColor(.primary)
                        }
                    }
                    .padding(.top, 15)
                    .padding(.horizontal, 25)
                    
                    ThickDivider()
                        .padding(.top, 30)
                    
                    TitleText("이번 달 기록")
                        .padding(.top, 20)
                        .padding(.horizontal, 25)
                    
                    RecentRecordList()
                        .padding(.top, 10)
                        .padding(.horizontal, 25)
                    
                    ThickDivider()
                        .padding(.top, 15)
                    
                    TitleText("지난 달에 마신 양")
                        .padding(.top, 20)
                        .padding(.horizontal, 25)
                    
                    LastDrinkRecordList()
                        .padding(.top, 15)
                        .padding(.horizontal, 25)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("술록")
        }
    }
}
