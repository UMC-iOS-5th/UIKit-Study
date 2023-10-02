//
//  UIStackViewTest.swift
//  UIKit-Study
//
//  Created by Kyungsoo Lee on 2023/10/01.
//

import UIKit

class UIStackViewTest: UIViewController {
    // MARK: - StackView
    // FirstView
    private lazy var firstView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    // SecondView
    private lazy var secondView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    // ThirdView
    private lazy var thirdView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    private lazy var uiStackView: UIStackView = {
        let stackView = UIStackView()
        // StackView에 뷰들을 추가
        stackView.addArrangedSubview(firstView)
        stackView.addArrangedSubview(secondView)
        stackView.addArrangedSubview(thirdView)
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemGray
        
        // 뷰 추가(아직 layout 설정 안된 상태)
        
        self.view.addSubview(uiStackView)
        
        setLayout()
    }
    // MARK: - UIStackViewLayout 제약 조건
    private func setUIStackViewLayout() {
        // tabBarController를 현재 뷰 컨트롤러의 view에 꽉 차게 설정
        let stackViewConstraint = [
            uiStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            uiStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            uiStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            uiStackView.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(stackViewConstraint)
    }
    
    // MARK: - 전체 제약조건 설정
    // 컴포넌트들의 레이아웃을 설정한다
    private func setLayout() {
        // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.
        
        // TabBarController 제약조건 설정
        setUIStackViewLayout()
    }
}

// UIKit으로 짠 화면을 SwiftUI로 바로 볼 수 있게 해주는 코드
import SwiftUI

@available(iOS 13.0.0, *)
struct UIStackViewTestPreview: PreviewProvider {
    static var previews: some View {
        UIStackViewTest().toPreview()
    }
}
