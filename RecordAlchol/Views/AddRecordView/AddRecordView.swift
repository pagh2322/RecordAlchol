//
//  AddRecordView.swift
//  RecordAlchol
//
//  Created by peo on 2022/04/27.
//

import SwiftUI

struct AddRecordView: View {
    @Binding var showModalView: Bool
    @State var beerSelected = true
    @State var sojuSelected = false
    @State var number = ""
    @State var price = ""
    @State var name = ""
    @State var selectedDate = Date()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("종류")
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text("맥주")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(RoundedRectangle(cornerRadius: 6)
                            .stroke(self.beerSelected ? .primary : .secondary, lineWidth: 1))
                        .foregroundColor(self.beerSelected ? .primary : .secondary)
                        .onTapGesture {
                            self.sojuSelected = false
                            self.beerSelected = true
                        }
                    
                    Text("소주")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(RoundedRectangle(cornerRadius: 6)
                            .stroke(self.sojuSelected ? .primary : .secondary, lineWidth: 1))
                        .foregroundColor(self.sojuSelected ? .primary : .secondary)
                        .onTapGesture {
                            self.beerSelected = false
                            self.sojuSelected = true
                        }
                        .padding(.leading, 15)
                    
                    Spacer()
                }
                .padding(.top, 20)
                Divider()
                    .padding(.top, 10)
                
                HStack {
                    Text("이름")
                        .foregroundColor(.secondary)
                    
                    TextField("술의 이름을 입력하세요", text: self.$name)
                        .keyboardType(.default)
                        .multilineTextAlignment(.trailing)
                        .padding(.leading, 71)
                }
                .padding(.top, 20)
                Divider()
                    .padding(.top, 20)
                
                HStack {
                    Text("양")
                        .foregroundColor(.secondary)
                    
                    TextField("병 크기는 소주병 기준입니다", text: self.$number)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                        .padding(.leading, 60)
                    
                    Text("병")
                }
                .padding(.top, 20)
                Divider()
                    .padding(.top, 20)
                
                HStack {
                    Text("날짜")
                        .foregroundColor(.secondary)
                    DatePicker("", selection: $selectedDate, displayedComponents: .date)
                }
                .padding(.top, 20)
                Divider()
                    .padding(.top, 20)
                
                HStack {
                    Text("금액")
                        .foregroundColor(.secondary)
                    
                    TextField("금액을 입력하세요", text: self.$price)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                        .padding(.leading, 45)
                    
                    Text("원")
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding(.horizontal, 25)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        self.showModalView = false
                    }) {
                        Text("취소")
                            .bold()
                    }
                    .foregroundColor(.primary)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        
                    }) {
                        Text("완료")
                            .bold()
                    }
                    .foregroundColor(self.name.isEmpty || self.number.isEmpty || self.price.isEmpty ? .secondary : .primary)
                }
            }
        }
    }
}
