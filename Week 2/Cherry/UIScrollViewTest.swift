//
//  UIScrollViewTest.swift
//  w3
//
//  Created by 이희주 on 2023/10/09.
//


//scroll view

import Foundation
import SwiftUI
import UIKit

class UIScrollViewTest: UIViewController {
    private lazy var scrollElementFirstView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    } ()
    
    private lazy var scrollElementSecondView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    } ()
    
    private lazy var scrollElementThirdView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    } ()
    
    private lazy var scrollElementFourthView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    } ()
    
    //add each view to one stack view
    private lazy var scrollElementUiStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        stackView.addArrangedSubview(scrollElementFirstView)
        stackView.addArrangedSubview(scrollElementSecondView)
        stackView.addArrangedSubview(scrollElementThirdView)
        stackView.addArrangedSubview(scrollElementFourthView)
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    } ()
    
    //set scroll view to the stack view
    private lazy var uIScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.addSubview(scrollElementUiStackView)
        scrollView.backgroundColor = .black
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        self.view.addSubview(uIScrollView)
        
        setLayout()
    }
    
    private func setScrollElementViewLayout() {
     
            let elementViewConstraint = [
                        scrollElementFirstView.widthAnchor.constraint(equalTo: uIScrollView.widthAnchor),
                        scrollElementFirstView.heightAnchor.constraint(equalToConstant: 200),
                        scrollElementSecondView.widthAnchor.constraint(equalTo: uIScrollView.widthAnchor),
                        scrollElementSecondView.heightAnchor.constraint(equalToConstant: 200),
                        scrollElementThirdView.widthAnchor.constraint(equalTo: uIScrollView.widthAnchor),
                        scrollElementThirdView.heightAnchor.constraint(equalToConstant: 200),
                        scrollElementFourthView.widthAnchor.constraint(equalTo: uIScrollView.widthAnchor),
                        scrollElementFourthView.heightAnchor.constraint(equalToConstant: 200)
                        ]
        
        
        NSLayoutConstraint.activate(elementViewConstraint)
    }
    
    //scroll view constraint
    private func setUIScrollElementStackViewLayout() {
        let stackViewConstraint = [
            scrollElementUiStackView.leadingAnchor.constraint(equalTo: uIScrollView.contentLayoutGuide.leadingAnchor),
            scrollElementUiStackView.trailingAnchor.constraint(equalTo: uIScrollView.contentLayoutGuide.trailingAnchor),
            scrollElementUiStackView.topAnchor.constraint(equalTo: uIScrollView.contentLayoutGuide.topAnchor),
            scrollElementUiStackView.bottomAnchor.constraint(equalTo: uIScrollView.contentLayoutGuide.bottomAnchor)
                ]
            
        NSLayoutConstraint.activate(stackViewConstraint)
    }
    
        //UIScrollView Constraints
    private func setUIScrollViewLayout() {
        let scrollViewConstraint = [
            uIScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            uIScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            uIScrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            uIScrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(scrollViewConstraint)
    }
    
    private func setLayout() {
        setScrollElementViewLayout()
        setUIScrollElementStackViewLayout()
        setUIScrollViewLayout()
    }
}

@available(iOS 13.0.0, *)
struct UIScrollViewTestPreview: PreviewProvider {
    static var previews: some View {
        UIScrollViewTest().toPreview()
    }
}
