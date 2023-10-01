//
//  UITextViewTest.swift
//  UIKit-Study
//
//  Created by Kyungsoo Lee on 2023/09/30.
//

import UIKit

class UITextViewTest: UIViewController, UITextViewDelegate {
    //MARK: - UITextView
    private lazy var uiTextView: UITextView = {
       let textView = UITextView()
        textView.text = "UITextView"
        textView.textAlignment = .center
        textView.backgroundColor = .black
        textView.textColor = .white
        textView.font = .systemFont(ofSize: 24, weight: .medium)
        textView.layer.borderWidth = 5
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.isEditable = true
        textView.delegate = self
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemGray
        
        // 뷰 추가(아직 layout 설정 안된 상태)
        self.view.addSubview(uiTextView)
        
        setLayout()
    }

    // MARK: - UITextView 제약 조건
    private func setUITextViewLayout() {
        let uiTextViewConstraint = [
            // 다른 컴포넌트의 상대적인 위치로 제약조건을 설정할 수도 있다.
            uiTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            uiTextView.widthAnchor.constraint(equalToConstant: 200), // 너비 제약 조건 추가
            uiTextView.heightAnchor.constraint(equalToConstant: 200) // 높이 제약 조건 추가
        ]
        NSLayoutConstraint.activate(uiTextViewConstraint)
    }


    // MARK: - 전체 제약조건 설정
    // 컴포넌트들의 레이아웃을 설정한다
    private func setLayout() {
        // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.
        
        // UITextView 제약조건 설정
        setUITextViewLayout()
    }
}

import SwiftUI

@available(iOS 13.0.0, *)
struct UITextViewTestPreView: PreviewProvider {
    static var previews: some View {
        UITextViewTest().toPreview()
    }
}
