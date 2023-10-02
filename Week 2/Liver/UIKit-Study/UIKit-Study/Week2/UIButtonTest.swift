//
//  UIButtonTest.swift
//  UIKit-Study
//
//  Created by Kyungsoo Lee on 2023/09/30.
//

import UIKit

class UIButtonTest: UIViewController {
    // MARK: - UIButton
    private lazy var uiButton: UIButton = {
        let button = UIButton()
        button.setTitle("UIButton", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray2
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    // MARK: - UIBUtton이 눌렸을 때 호출되는 액션 함수
    @objc func buttonTapped() {
        print("버튼이 눌렸습니다.")
    }

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemGray
        
        // 뷰 추가(아직 layout 설정 안된 상태)
        self.view.addSubview(uiButton)
        
        setLayout()
    }

    // MARK: - UIButton 제약조건
    private func setUIButtonLayout() {
        let uiButtonConstraint = [
            // 다른 컴포넌트의 상대적인 위치로 제약조건을 설정할 수도 있다.
            uiButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        NSLayoutConstraint.activate(uiButtonConstraint)
    }

    // MARK: - 전체 제약조건 설정
    // 컴포넌트들의 레이아웃을 설정한다
    private func setLayout() {
        // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.
      
        // UIButton 제약조건 설정
        setUIButtonLayout()
    }
}

import SwiftUI

@available(iOS 13.0.0, *)
struct UIButtonTestPreview: PreviewProvider {
    static var previews: some View {
        UIButtonTest().toPreview()
    }
}
