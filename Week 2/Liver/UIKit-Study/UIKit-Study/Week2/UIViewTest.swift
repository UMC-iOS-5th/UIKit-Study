//
//  UIViewTest.swift
//  UIKit-Study
//
//  Created by Kyungsoo Lee on 2023/09/30.
//

import UIKit

class UIViewTest: UIViewController {
    // MARK: - UIView
    private lazy var uiView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemGray
        
        // 뷰 추가(아직 layout 설정 안된 상태)
        self.view.addSubview(uiView)
        
        setLayout()
    }

    // MARK: - UIView 제약조건
    private func setUIViewLayout() {
        let uiViewConstraint = [
            uiView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            uiView.widthAnchor.constraint(equalToConstant: 100),
            uiView.heightAnchor.constraint(equalToConstant: 100)
        ]
        // 제약 조건을 활성화 시켜 오토 레이아웃 설정한다.
        NSLayoutConstraint.activate(uiViewConstraint)
    }

    // MARK: - 전체 제약조건 설정
        // 컴포넌트들의 레이아웃을 설정한다
        private func setLayout() {
            // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.
            
            // UIView 제약조건 설정
            setUIViewLayout()
        }
}

import SwiftUI

@available(iOS 13.0.0, *)
struct UIViewTestPreView: PreviewProvider {
    static var previews: some View {
        UIViewTest().toPreview()
    }
}
