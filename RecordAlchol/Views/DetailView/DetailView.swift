//
//  DetailView.swift
//  RecordAlchol
//
//  Created by peo on 2022/04/27.
//

import SwiftUI

struct DetailView: View {
    var alchol: Alchol
    var number: Int
    var price: Int
    @State var showModalView = false
    @State var month: Int
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading, spacing: 0) {
                // 월 이동 버튼
                HStack {
                    Button(action: {
                        if self.month == 1 {
                            self.month = 12
                        } else {
                            self.month -= 1
                        }
                    }) {
                        Image(systemName: "chevron.left")
                    }
                    .foregroundColor(.primary)
                    
                    Text("\(self.month)월")
                        .bold()
                    
                    Button(action: {
                        if self.month == 12 {
                            self.month = 1
                        } else {
                            self.month += 1
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
                    Text("\(self.number)병 마셨어요")
                        .font(.title)
                        .bold()
                    Spacer()
                    
                    Text("\(self.price)원")
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
                    Spacer()
                    
                    Button(action: {
                        self.showModalView = true
                    }) {
                        Text("+ 기록 추가")
                    }
                    .foregroundColor(.primary)
                    .sheet(isPresented: self.$showModalView) {
                        AddRecordView(showModalView: self.$showModalView)
                    }
                }
                .padding(.top, 30)
                .padding(.horizontal, 25)
                
                
                AllRecordList()
                    .padding(.top, 15)
                    .padding(.horizontal, 25)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
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
    }
}
