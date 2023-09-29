# [1주차] Swift란?

- 변수와 상수 (var, let)
    - 변수 : 선언 이후 값을 변경할 수 있음 (가변적)
    - 상수 : 선언 이후 값을 변경할 수 없음 (불변적)
    
    ```swift
    // 변수 선언
    var x = 0
    
    // 변수는 선언 이후에 값을 변경할 수 있음 (가변적)
    x = 2
    
    // 상수 선언
    let y = 0
    
    // 상수는 선언 이후에 값을 변경할 수 없음 (불변적)
    //y = 10    (X)
    ```
    
- 타입 세이프티 & 타입 추론 (Type Safety & Type Inference)
    
    스위프트는 기본적으로 데이터 타입에 엄격한 언어임.
    
    하지만 변수를 선언할 때 초기화를 같이 해준다면, 아래 예제와 같이 자료형 없이 타입 추론이 가능함.
    
    ```swift
    // 타입 명시를 통한 변수 선언
    var intNumber: Int = 5
    
    // 5 is Int
    print("\(intNumber) is \(type(of: intNumber))")
    
    // 타입 추론을 통한 변수 선언
    var doubleNumber = 5.0
    
    // 5.0 is Double
    print("\(doubleNumber) is \(type(of: doubleNumber))")
    ```
    
- 옵셔널 (Optionals)
    - nil : 값이 없는 상태
    - 옵셔널(Optional) : 값이 nil일 수도 있고 아닐 수도 있는 경우 사용 (값이 0인 경우는 값이 있지만 0인 것임. 착각하면 안됨)
    
    (즉, 값이 nil일 가능성이 있으면 Optional을 사용해야 한다.)
    
    ```swift
    // 옵셔널 변수 선언
    var optionalNumberVar: Int?
    
    // optionalVariable's type is Optional<Int>
    print("optionalNumberVar's type is \(type(of: optionalNumberVar))")
    
    // optionalVariable is nil
    print("optionalNumberVar is \(optionalNumberVar)")
    
    optionalNumberVar = 5
    
    // optionalVariable is Optional(5)
    print("optionalNumberVar is \(optionalNumberVar)")
    ```
    
    optionalVariable에 값을 넣었지만, 여전히 type은 Optional인 것을 알 수 있음. 즉, 값이 nil에서 다른 값으로 변한다고 해서 자료형이 바뀌는 것이 아님. 여전히 “Optional(5)”와 같이 옵셔널 자료형을 유지함.
    
- 옵셔널 바인딩 (Optional Binding)
    
    옵셔널 바인딩 : 옵셔널 변수가 nil인지 아닌지 판단하고, nil이 아니라면 일반 변수처럼 사용할 수 있도록 임시 상수 또는 변수로 변환해주는 것. 크게 3가지가 있음.
    
    1. 강제 언래핑
        
        ```swift
        // 강제 언래핑(!)
        // optionalVariable's type is Int
        print("optionalVariable's type is \(type(of: optionalVariable!))")
        // optionalVariable is 5
        print("optionalVariable is \(optionalVariable!)")
        ```
        
    2. if-let
        
        ```swift
        // if-let
        if let ifLetVariable = optionalVariable {
            // ifLetVariable's type is Int
            print("ifLetVariable's type is \(type(of: ifLetVariable))")
            // ifLetVariable is 5
            print("ifLetVariable is \(ifLetVariable)")
        } else {
            print("Failed optional binding")
        }
        ```
        
    3. guard-let
        
        ```swift
        // guard-let
        guard let guardLetVariable = optionalVariable else {
            print("Failed optional binding")
            return
        }
        // guardLetVariable's type is Int
        print("guardLetVariable's type is \(type(of: guardLetVariable))")
        // guardLetVariable is 5
        print("guardLetVariable is \(guardLetVariable)")
        ```
        
    4. 암시적으로 언래핑 된 옵셔널
        
        ```swift
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
        ```
        
        암시적으로 언래핑된 옵셔널은 선언할 때 (?)대신 (!)를 통해 선언한다. 암시적으로 언래핑 된 옵셔널은 옵셔널이지만, 값이 있다고 가정하고 옵셔널이지만 일반 변수처럼 사용할 수 있게 해준다.
        

<aside>
👋🏻 [추가로 공부할 키워드]
내･외부 파라미터명 /  클로저 / 옵셔널 체이닝 / 프로토콜 / 자동 참조 카운팅 / 고차 함수 …

</aside>

### <실습 인증>

<변수와 상수>

<옵셔널>

<타입 세이프티 & 타입 추론>

<옵셔널 바인딩>

[스위프트 번역본]

[https://bbiguduk.gitbook.io/swift/](https://bbiguduk.gitbook.io/swift/)