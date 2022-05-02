//
//  RecordAlcholApp.swift
//  RecordAlchol
//
//  Created by peo on 2022/04/27.
//

import SwiftUI

@main
struct RecordAlcholApp: App {
    @StateObject var allData = AllData()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(self.allData)
        }
    }
}
