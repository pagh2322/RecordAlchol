//
//  ThickDivider.swift
//  RecordAlchol
//
//  Created by peo on 2022/05/02.
//

import SwiftUI

struct ThickDivider: View {
    var body: some View {
        Rectangle()
            .fill(Color(UIColor.systemGroupedBackground))
            .frame(width: UIScreen.main.bounds.width, height: 15)
    }
}
