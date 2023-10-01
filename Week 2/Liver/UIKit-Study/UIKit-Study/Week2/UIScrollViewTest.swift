//
//  UIScrollViewTest.swift
//  UIKit-Study
//
//  Created by Kyungsoo Lee on 2023/10/01.
//

import UIKit

class UIScrollViewTest: UIViewController {
    // MARK: - ScrollView
    // FirstView
    private lazy var scrollElementFirstView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    // SecondView
    private lazy var scrollElementSecondView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    // ThirdView
    private lazy var scrollElementThirdView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // FourthView
    private lazy var scrollElementFourthView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var scrollElementUiStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        // StackView에 뷰들을 추가
        stackView.addArrangedSubview(scrollElementFirstView)
        stackView.addArrangedSubview(scrollElementSecondView)
        stackView.addArrangedSubview(scrollElementThirdView)
        stackView.addArrangedSubview(scrollElementFourthView)
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var uiScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.addSubview(scrollElementUiStackView)
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .gray
        
        self.view.addSubview(uiScrollView)

        setLayout()
    }
    
    // MARK: - UIScrollViewLayout 제약 조건
    private func setScrollElementViewsLayout() {
        let elementViewsConstraint = [
            scrollElementFirstView.widthAnchor.constraint(equalTo: uiScrollView.widthAnchor),
            scrollElementFirstView.heightAnchor.constraint(equalToConstant: 200),
            scrollElementSecondView.widthAnchor.constraint(equalTo: uiScrollView.widthAnchor),
            scrollElementSecondView.heightAnchor.constraint(equalToConstant: 200),
            scrollElementThirdView.widthAnchor.constraint(equalTo: uiScrollView.widthAnchor),
            scrollElementThirdView.heightAnchor.constraint(equalToConstant: 200),
            scrollElementFourthView.widthAnchor.constraint(equalTo: uiScrollView.widthAnchor),
            scrollElementFourthView.heightAnchor.constraint(equalToConstant: 200)
            ]
        NSLayoutConstraint.activate(elementViewsConstraint)
    }

    // UIStackViewLayout 제약 조건
    private func setUIScrollElementStackViewLayout() {
        let stackViewConstraint = [
            scrollElementUiStackView.leadingAnchor.constraint(equalTo: uiScrollView.contentLayoutGuide.leadingAnchor),
            scrollElementUiStackView.trailingAnchor.constraint(equalTo: uiScrollView.contentLayoutGuide.trailingAnchor),
            scrollElementUiStackView.topAnchor.constraint(equalTo: uiScrollView.contentLayoutGuide.topAnchor),
            scrollElementUiStackView.bottomAnchor.constraint(equalTo: uiScrollView.contentLayoutGuide.bottomAnchor)
            ]
        
        NSLayoutConstraint.activate(stackViewConstraint)
    }
    
    // UIScrollViewLayout 제약조건
    private func setUIScrollViewLayout() {
        let scrollViewConstraint = [
            uiScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            uiScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // safeLayoutGuide로 잡으면 safelayout 바깥 쪽은 스크롤 X
            uiScrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            uiScrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
            ]
        
        NSLayoutConstraint.activate(scrollViewConstraint)
    }
    
    // MARK: - 전체 제약조건 설정
    // 컴포넌트들의 레이아웃을 설정한다
    private func setLayout() {
        setScrollElementViewsLayout()
        setUIScrollElementStackViewLayout()
        setUIScrollViewLayout()
    }
}

// UIKit으로 짠 화면을 SwiftUI로 바로 볼 수 있게 해주는 코드
import SwiftUI

@available(iOS 13.0.0, *)
struct UIScrollViewTestPreview: PreviewProvider {
    static var previews: some View {
        UIScrollViewTest().toPreview()
    }
}
