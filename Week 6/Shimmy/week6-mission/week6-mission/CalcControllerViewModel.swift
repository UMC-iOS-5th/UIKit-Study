//
//  CalcControllerViewModel.swift
//  week6-mission
//
//  Created by Seungbo Shim on 2023/11/07.
//

import Foundation

class CalcControllerViewModel {
    // MARK: - TableView DataSource Array
    // 계산기 버튼 위치
    // Model(CalculatorButton)의 정보(text, color)를 View(ButtonCell)에 가져오고, ViewModel에서 이 위치에 따라 배치
    let calcButtonCells: [CalculatorButton] = [
        .allClear, .plusMinus, .percentage, .divide,
        .number(7), .number(8), .number(9), .multiply,
        .number(4), .number(5), .number(6), .subtract,
        .number(3), .number(2), .number(1), .add,
        .number(0), .decimal, .equals
    ]
    
    private(set) lazy var calcHeaderLabel: String = "42"
}
