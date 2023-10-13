//
//  UIStackViewTest.swift
//  UMC-Study

import UIKit

class UIStackViewTest: UIViewController {
    // MARK: - StackView
    // FirstView
    private lazy var firstView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()

    // SecondView
    private lazy var secondView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()

    // ThirdView
    private lazy var thirdView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    // FourthView
    private lazy var FourthView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    private lazy var uiStackView: UIStackView = {
        let stackView = UIStackView()
        // StackView에 뷰들을 추가
        stackView.addArrangedSubview(firstView)
        stackView.addArrangedSubview(secondView)
        stackView.addArrangedSubview(thirdView)
        stackView.addArrangedSubview(FourthView)
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
            uiStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            uiStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 200),
            uiStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            uiStackView.heightAnchor.constraint(equalToConstant: 100)
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
struct UIStackViewTestPreView: PreviewProvider {
    static var previews: some View {
        UIStackViewTest().toPreview()
    }
}
