//
//  CalcControllerViewModel.swift
//  week6-mission
//
//  Created by Seungbo Shim on 2023/11/07.
//

import Foundation

enum CurrentNumber {
    case firstNumber
    case secondNumber
}

class CalcControllerViewModel {
    var updateViews: (()->Void)?
    
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
    
    // private(set) : 해당 변수의 setter를 private으로 지정
    private(set) lazy var calcHeaderLabel: String = self.firstNumber ?? "0"
    private(set) var currentNumber: CurrentNumber = .firstNumber
    
    private(set) var firstNumber: String? = nil {
        didSet {
            self.calcHeaderLabel = self.firstNumber?.description ?? "0"
        }
    }
    private(set) var secondNumber: String? = nil {
        didSet {
            self.calcHeaderLabel = self.secondNumber?.description ?? "0"
        }
    }
    private(set) var operation: CalculatorOperation? = nil
    private(set) var firstNumberIsDecimal: Bool = false
    private(set) var secondNumberIsDecimal: Bool = false
    
    var eitherNumberIsDecimal: Bool {
        return firstNumberIsDecimal || secondNumberIsDecimal
    }
    
    // MARK: - Memory Variables
    // "=" 누르면 이전 숫자가 반복되어 연산
    private(set) var prevNumber: String? = nil
    private(set) var prevOperation: CalculatorOperation? = nil
    
    // MARK: - Businiss Logic
    public func didSelectButton(with calcButton: CalculatorButton) {
        switch calcButton {
        case .allClear: self.didSelectAllclear()
        case .plusMinus: self.didSelectPlusMinus()
        case .percentage: self.didSelectPercentage()
        case .divide: self.didSelectOperation(with: .divide)
        case .multiply: self.didSelectOperation(with: .multiply)
        case .subtract: self.didSelectOperation(with: .subtract)
        case .add: self.didSelectOperation(with: .add)
        case .equals: self.didSelectedEqualsButton()
        case .number(let number): self.didSelectNumber(with: number)
        case .decimal: self.didSelectDecimal()
        }
        
        self.updateViews?()
    }
    
    // MARK: - All Clear
    private func didSelectAllclear() {
        self.calcHeaderLabel = "0"
        self.currentNumber = .firstNumber
        self.firstNumber = nil
        self.secondNumber = nil
        self.operation = nil
        self.firstNumberIsDecimal = false
        self.secondNumberIsDecimal = false
        self.prevNumber = nil
        self.prevOperation = nil
    }
    
    // MARK: - Selecting Numbers
    private func didSelectNumber(with number: Int) {
        
        if self.currentNumber == .firstNumber {
            // if let -> 상수로 옵셔널 바인딩, if let -> 변수로 옵셔널 바인딩
            if var firstNumber = self.firstNumber {
                // 기존에 입력되어있던 firstNumber에 새로 입력한 (파라미터의)number를 뒤에 이어서 붙여주는 동작
                firstNumber.append(number.description)
                self.firstNumber = firstNumber
                self.prevNumber = firstNumber
            } else {
                // 기존에 아무 것도 입력되어있지 않다면, number를 String으로 변환하여 firstNumber에 넣어준다.
                self.firstNumber = number.description
                self.prevNumber = number.description
            }
        } else {
            if var secondNumber = self.secondNumber {
                // 기존에 입력되어있던 secondNumber에 새로 입력한 (파라미터의)number를 뒤에 이어서 붙여주는 동작
                secondNumber.append(number.description)
                self.secondNumber = secondNumber
                self.secondNumber = secondNumber
            } else {
                // 기존에 아무 것도 입력되어있지 않다면, number를 String으로 변환하여 secondNumber에 넣어준다.
                self.secondNumber = number.description
                self.prevNumber = number.description
            }
        }
    }
    
    // MARK: - Equals & ArithmeticOperations
    
    private func didSelectedEqualsButton() {
        
        if let operation = self.operation,
           let firstNumber = self.firstNumber?.toDouble,
           // secondNumber가 존재하는 경우
           let secondNumber = self.secondNumber?.toDouble {
            
            // firstNumber와 secondNumber 다음에 정상적으로 Equals가 눌러지는 경우
            let result = self.getOperationResult(operation, firstNumber, secondNumber)
            // firstNumber과 secondNumber가 둘 다 Decimal(소수)라면 그대로 출력하고, 그렇지 않으면 Int로 변환하여 출력한다.
            let resultString = self.eitherNumberIsDecimal ? result.description : result.toInt?.description
            
            self.secondNumber = nil
            self.prevOperation = operation
            self.operation = nil
            self.firstNumber = resultString
            self.currentNumber = .firstNumber
            // secondNumberrk 존재하지 않는 경우 -> firstNumber와 prevOperation을 가지고 계산한다.
        } else if let prevOperation = self.prevOperation,
                  let firstNumber = self.firstNumber?.toDouble,
                  // 이전에 입력된 숫자가 없는 경우
                  let prevNumber = self.prevNumber?.toDouble {
            
            // firstNumber와 operation을 기반한 연산으로 result가 업데이트된다.
            let result = self.getOperationResult(prevOperation, firstNumber, prevNumber)
            let resultString = self.eitherNumberIsDecimal ? result.description : result.toInt?.description
            self.firstNumber = resultString
        }
    }
    
    private func didSelectOperation(with operation: CalculatorOperation) {
        // firstNumber와 operation만 입력된 상태일 때
        if self.currentNumber == .firstNumber {
            self.operation = operation
            self.currentNumber = .secondNumber
            // firstNumber, operation, secondNumber까지 입력된 상태일 때 -> 새로운 operation이 들어오면 이전의 결과값을 출력해준다.
        } else if self.currentNumber == .secondNumber {
            if let prevOperation = self.operation,
               let firstNumber = self.firstNumber?.toDouble,
               let secondNumber = self.secondNumber?.toDouble {
                // 이후 추가로 연산자가 들어올 경우 이전 값을 출력해주고 새로운 연산자를 받아야 하는데, 출력 값은 이전에 입력받았던 연산자를 사용해야하므로, opearion이 아닌 prevOperation을 사용한다.
                let result = self.getOperationResult(prevOperation, firstNumber, secondNumber)
                let resultString = self.eitherNumberIsDecimal ? result.description : result.toInt?.description
                self.secondNumber = nil
                self.firstNumber = resultString
                self.currentNumber = .secondNumber
                self.operation = operation
            } else {
                // secondNumber가 없으면 operation만 새로 갱신해준다.
                self.operation = operation
            }
        }
    }
    
    // MARK: - Helper
    private func getOperationResult(_ operation: CalculatorOperation, _ firstNumber: Double?, _ secondNumber: Double?) -> Double {
        guard let firstNumber = firstNumber,
              let secondNumber = secondNumber else { return 0 }
        switch operation {
        case .divide:
            return (firstNumber / secondNumber)
        case .multiply:
            return (firstNumber * secondNumber)
        case .subtract:
            return (firstNumber - secondNumber)
        case .add:
            return (firstNumber + secondNumber)
            
        }
    }
    
    // MARK: - Action Buttons
    private func didSelectPlusMinus() {
        // firstNumber만 입력된 경우
        if self.currentNumber == .firstNumber, var number = self.firstNumber {
            if number .contains("-") {
                number.removeFirst()
            } else {
                number.insert("-", at: number.startIndex)
            }
            
            self.firstNumber = number
            self.prevNumber = number
        } else if self.currentNumber == .secondNumber, var number = self.secondNumber {
            // secondNumber까지 입력된 경우
            if number .contains("-") {
                number.removeFirst()
            } else {
                number.insert("-", at: number.startIndex)
            }
            
            self.secondNumber = number
            self.prevNumber = number
        }
    }
    
    private func didSelectPercentage() {

        if self.currentNumber == .firstNumber, var number = self.firstNumber?.toDouble {
            number /= 100
            if number.isInteger {
                self.firstNumber = number.toInt?.description
            } else {
                self.firstNumber = number.description
                self.firstNumberIsDecimal = true
            }
        } else if self.currentNumber == .secondNumber, var number = self.secondNumber?.toDouble {

            number /= 100
            if number.isInteger {
                self.secondNumber = number.toInt?.description
            } else {
                self.secondNumber = number.description
                self.secondNumberIsDecimal = true
            }
        }
    }
    
    private func didSelectDecimal() {
        
        if self.currentNumber == .firstNumber {
            self.firstNumberIsDecimal = true

            if let firstNumber = self.firstNumber, !firstNumber.contains(".") {
                self.firstNumber = firstNumber.appending(".")

            } else if self.firstNumber == nil {
                self.firstNumber = "0."
            }
        } else if self.currentNumber == .secondNumber {
            self.secondNumberIsDecimal = true

            if let secondNumber = self.secondNumber, !secondNumber.contains(".") {
                self.secondNumber = secondNumber.appending(".")

            } else if self.secondNumber == nil {
                self.secondNumber = "0."
            }
        }
    }

}
