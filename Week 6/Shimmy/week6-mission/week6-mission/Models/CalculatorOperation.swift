//
//  CalculatorOperation.swift
//  week6-mission
//
//  Created by Seungbo Shim on 2023/11/14.
//

import Foundation

enum CalculatorOperation {
    case divide
    case multiply
    case subtract
    case add
    
    var title: String {
        switch self {
        case .divide:
            return "/"
        case .multiply:
            return "x"
        case .subtract:
            return "-"
        case .add:
            return "+"
        }
    }
}
