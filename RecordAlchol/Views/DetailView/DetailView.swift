//
//  DetailView.swift
//  RecordAlchol
//
//  Created by peo on 2022/04/27.
//

import SwiftUI

struct DetailView: View {
    var alchol: Alchol
    @State var showModalView = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var allData: AllData
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading, spacing: 0) {
                // 월 이동 버튼
                HStack {
                    Button(action: {
                        if self.allData.currentMonthForDetailView == 1 {
                            self.allData.currentMonthForDetailView = 12
                        } else {
                            self.allData.currentMonthForDetailView -= 1
                        }
                    }) {
                        Image(systemName: "chevron.left")
                    }
                    .foregroundColor(.primary)
                    
                    Text("\(self.allData.currentMonthForDetailView)월")
                        .bold()
                    
                    Button(action: {
                        if self.allData.currentMonthForDetailView == 12 {
                            self.allData.currentMonthForDetailView = 1
                        } else {
                            self.allData.currentMonthForDetailView += 1
                        }
                    }) {
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(.primary)
                    
                    Spacer()
                }
                .padding(.top, 15)
                .padding(.horizontal, 25)
                
                Text(self.alchol.title)
                    .padding(.top, 20)
                    .padding(.horizontal, 25)
                
                HStack {
                    Text("\(self.alchol == .beer ? self.allData.numberOfDetailCurrentMonthBeerRecord : self.allData.numberOfDetailCurrentMonthSojuRecord)병 마셨어요")
                        .font(.title)
                        .bold()
                    Spacer()
                    
                    Text("\(self.alchol == .beer ? self.allData.priceOfDetailCurrentMonthBeerRecord : self.allData.priceOfDetailCurrentMonthSojuRecord)원")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 10)
                .padding(.horizontal, 25)
                
                ThickDivider()
                    .padding(.top, 20)
                
                HStack {
                    Text("전체 기록")
                        .font(.title3)
                        .bold()
                    Spacer()
                    
                    Button(action: {
                        self.showModalView = true
                    }) {
                        Text("+ 기록 추가")
                    }
                    .foregroundColor(.primary)
                    .sheet(isPresented: self.$showModalView) {
                        AddRecordView(showModalView: self.$showModalView, beerSelected: self.alchol == .beer ? true : false)
                    }
                }
                .padding(.top, 30)
                .padding(.horizontal, 25)
                
                
                AllRecordList(alchol: self.alchol)
                    .padding(.top, 15)
                    .padding(.horizontal, 25)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationTitle(self.alchol == .beer ? "맥주" : "소주")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.primary)
                }
            }
        }
        .onAppear {
            self.allData.update()
            self.allData.currentMonthForDetailView = self.allData.currentMonth
        }
    }
}
