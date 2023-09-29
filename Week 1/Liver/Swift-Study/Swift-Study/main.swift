//
//  main.swift
//  swiftstudyumc
//
//  Created by Kyungsoo Lee on 2023/09/28.
//

import Foundation

// MARK: - 변수와 상수 (var, let)
func varAndLet() {
    // 변수 선언
    var x = 0
    
    // x is 0
    print("x is \(x)")

    // 변수는 선언 이후에 값을 변경할 수 있음 (가변적)
    x = 2
    
    // x is 2
    print("x is \(x)")

    // 상수 선언
    let y = 0

    // 상수는 선언 이후에 값을 변경할 수 없음 (불변적)
    //y = 10    (X)
}

// MARK: - 타입 세이프티 & 타입 추론 (Type Safety & Type Inference)
func typeInference() {
    // 타입 명시를 통한 변수 선언
    var intNumber: Int = 5

    // 5 is Int
    print("\(intNumber) is \(type(of: intNumber))")

    // 타입 추론을 통한 변수 선언
    var doubleNumber = 5.0

    // 5.0 is Double
    print("\(doubleNumber) is \(type(of: doubleNumber))")
}

// MARK: - 옵셔널 (Optionals)
func optionals() {
    // 옵셔널 변수 선언
    var optionalVariable: Int?

    // optionalVariable's type is Optional<Int>
    print("optionalVariable's type is \(type(of: optionalVariable))")

    // optionalVariable is nil
    print("optionalVariable is \(optionalVariable)")

    optionalVariable = 5

    // optionalVariable is Optional(5)
    print("optionalVariable is \(optionalVariable)")
}

// MARK: - 옵셔널 바인딩 (Optional Binding)
func optionalBinding() {
    var optionalVariable: Int? = 5
    
    // 강제 언래핑(!)
    // optionalVariable's type is Int
    print("optionalVariable's type is \(type(of: optionalVariable!))")
    // optionalVariable is 5
    print("optionalVariable is \(optionalVariable!)")
    
    // if-let
    if let ifLetVariable = optionalVariable {
        // ifLetVariable's type is Int
        print("ifLetVariable's type is \(type(of: ifLetVariable))")
        // ifLetVariable is 5
        print("ifLetVariable is \(ifLetVariable)")
    } else {
        print("Failed optional binding")
    }
    
    // guard-let
    guard let guardLetVariable = optionalVariable else {
        print("Failed optional binding")
        return
    }
    // guardLetVariable's type is Int
    print("guardLetVariable's type is \(type(of: guardLetVariable))")
    // guardLetVariable is 5
    print("guardLetVariable is \(guardLetVariable)")
    
    // 암시적으로 언래핑 된 옵셔널
    var implicitlyUnwrappedOptionals: Int! = 10
    var tempNumber: Int
    
    // implicitlyUnwrappedOptionals is Optional(10)
    print("implicitlyUnwrappedOptionals is \(implicitlyUnwrappedOptionals)")
    
    // 원래대로라면 옵셔널 바인딩을 해야되지만, (!)를 사용한 옵셔널은 언래핑을 하지 않아도 된다.
    tempNumber = implicitlyUnwrappedOptionals
    // tempNumber = optionalVariable (X)
    
    // tempNumber is 10
    print("tempNumber is \(tempNumber)")
}

// MARK: - main
varAndLet()
//typeInference()
//optionals()
//optionalBinding()


