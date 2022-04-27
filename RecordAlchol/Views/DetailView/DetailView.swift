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
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Image(systemName: "chevron.left")
                    
                    Text("4월")
                        .bold()
                    
                    Image(systemName: "chevron.right")
                    
                    Spacer()
                }
                .padding(.top, 15)
                
                Text(self.alchol.title)
                    .padding(.top, 15)
                
                HStack {
                    Text("\(self.number)병 마셨어요")
                        .font(.title)
                        .bold()
                    Spacer()
                    
                    Text("\(self.price)원")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 20)
                
                HStack {
                    Text("전체 기록")
                        .font(.title2)
                        .padding(.top, 30)
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
                
                
                AllRecordList()
                    .padding(.top, 15)
            }
            .padding(.horizontal, 25)
        }
        .navigationBarTitleDisplayMode(.inline)
//        .navigationBarHidden(true)
    }
}
