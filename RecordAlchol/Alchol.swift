//
//  Alchol.swift
//  RecordAlchol
//
//  Created by peo on 2022/04/27.
//

import Foundation

enum Alchol {
    case beer
    case soju
    
    var title: String {
        switch self {
        case .beer:
            return "맥주"
        case .soju:
            return "소주"
        }
    }
    
    
}
