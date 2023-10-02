//
//  UITextFieldTest.swift
//  week2_231003
//
//  Created by Seungbo Shim on 2023/10/03.
//

import UIKit

class UITextFieldTest: UIViewController, UITextFieldDelegate {
    // MARK: - UITextField
    private lazy var uiTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "글자를 입력하세요."
        textField.backgroundColor = .white
        textField.textColor = .black
        // UITextField가 속한 컨트롤러에 "UITextFieldDelegate" 프로토콜을 추가해야 한다.
        // 사용자와 상호 작용하고 입력 이벤트를 처리하기 위해 프로토콜을 추가
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false

        textField.borderStyle = .line

        return textField
    }()

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.view.backgroundColor = .white

        // 뷰 추가(아직 layout 설정 안된 상태)
        self.view.addSubview(uiTextField)

        setLayout()
    }

    // MARK: - UITextField 제약조건
    private func setUITextFieldLayout() {
        let uiTextFieldConstraint = [
            // 다른 컴포넌트의 상대적인 위치로 제약조건을 설정할 수도 있다.
            uiTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            // 맞아맞아, 놀랍게도 그건 모두 사실이야.
        ]
        NSLayoutConstraint.activate(uiTextFieldConstraint)
    }

    // MARK: - 전체 제약조건 설정
    // 컴포넌트들의 레이아웃을 설정한다
    private func setLayout() {
        // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.

        // UITextField 제약조건 설정
        setUITextFieldLayout()
    }
}


import SwiftUI

@available(iOS 13.0.0, *)
struct UITextFieldTestPreView: PreviewProvider {
    static var previews: some View {
        UITextFieldTest().toPreview()
    }
}
