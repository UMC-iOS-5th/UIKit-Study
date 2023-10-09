//
//  UIStackView.swift
//  w3
//
//  Created by 이희주 on 2023/10/09.
//

//stack view
import Foundation
import UIKit
import SwiftUI

class UIStackViewTest: UIViewController {
    private lazy var firstView : UIView = {
       let view = UIView()
        view.backgroundColor = .red
        
        return view
    }()
    
    private lazy var secondView : UIView = {
       let view = UIView()
        view.backgroundColor = .green
        
        return view
    }()
    
    private lazy var thirdView : UIView = {
       let view = UIView()
        view.backgroundColor = .cyan
        
        return view
    }()
    
    private lazy var uIStackView : UIStackView = {
        let stackView = UIStackView()
        
        stackView.addArrangedSubview(firstView)
        stackView.addArrangedSubview(secondView)
        stackView.addArrangedSubview(thirdView)
        
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray
        self.view.addSubview(uIStackView)
        
        setLayout()
    }
    
    private func setUIStackViewLayout() {
        let stackViewConstraint = [
            uIStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            uIStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100),
            uIStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            uIStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 5)
        ]
        
        NSLayoutConstraint.activate(stackViewConstraint)
    }
    
    private func setLayout() {
        setUIStackViewLayout()
    }
}

@available(iOS 13.0.0, *)
struct UIStackViewTestPreView: PreviewProvider {
    static var previews: some View {
        UIStackViewTest().toPreview()
    }
}
