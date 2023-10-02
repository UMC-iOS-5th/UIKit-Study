//
//  UIViewTest.swift
//  231003
//
//  Created by Seungbo Shim on 2023/10/03.
//

import UIKit

class UIViewTest: UIViewController {
    // MARK: -UIView
    private lazy var uiView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    // MARK: -viewDidLiad
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemGray

        self.view.addSubview(uiView)

        setLayout()
    }

    // MARK: -UIView 제약조건
    private func setUIViewLayout() {
        let uiViewConstraint = [
            uiView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            uiView.widthAnchor.constraint(equalToConstant: 100),
            uiView.heightAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(uiViewConstraint)
    }

    // MARK: -전체 제약조건
    private func setLayout() {
        setUIViewLayout()
    }
}

// UIKit으로 짠 화면을 SwiftUI로 바로 볼 수 있게 해주는 코드
import SwiftUI


@available(iOS 13.0.0, *)
struct UIViewTestPreView: PreviewProvider {
    static var previews: some View {
        UIViewTest().toPreview()
    }
}
