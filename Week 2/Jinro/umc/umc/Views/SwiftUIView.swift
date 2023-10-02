//
//  SwiftUIView.swift
//  umc
//
//  Created by gourderased on 2023/10/02.
//

import UIKit

class UIViewTest: UIViewController {
    // MARK: - UIView
    private lazy var uiView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray
        
        self.view.addSubview(uiView)
        
        setLayout()
    }

    private func setUIViewLayout() {
        let uiViewConstraint = [
            uiView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            uiView.widthAnchor.constraint(equalToConstant: 200),
            uiView.heightAnchor.constraint(equalToConstant: 200)
            
        ]
        NSLayoutConstraint.activate(uiViewConstraint)
    }

        private func setLayout() {
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
