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
    @State var selectedDate = Date()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("종류")
                        .foregroundColor(.secondary)
                        .padding(.trailing, 45)
                    
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
                }
                .padding(.top, 20)
                Divider()
                    .padding(.top, 10)
                
                HStack {
                    Text("양")
                        .foregroundColor(.secondary)
                    
                    TextField("병 크기는 소주병 기준입니다", text: self.$number)
                        .keyboardType(.decimalPad)
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
                        Text("Cancel")
                            .font(.body)
                    }
                    .foregroundColor(.primary)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        
                    }) {
                        Text("Confirm")
                            .font(.body)
                    }
                    .foregroundColor(.primary)
                }
            }
        }
    }
}
