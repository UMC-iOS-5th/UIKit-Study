//
//  UINavigationControllerTest.swift
//  w3
//
//  Created by 이희주 on 2023/10/09.
//

import Foundation
import UIKit
import SwiftUI

class UINavigationControllerTest: UIViewController{
    private lazy var uINavigationController: UIViewController = {
        let rootViewController = UIViewController()
        rootViewController.view.backgroundColor = .systemGray
        rootViewController.title = "Root"
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.view.translatesAutoresizingMaskIntoConstraints = false
        
        return navigationController
    } ()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.green, for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    } ()
    
    @objc private func nextButtonTapped() {
        let destViewController = NextViewControllerTest()
        navigationController?.pushViewController(destViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        self.view.addSubview(uINavigationController.view)
        
        addChild(uINavigationController)
        uINavigationController.didMove(toParent: self)
        
        view.addSubview(nextButton)
        
        setLayout()
    }
    
    private func setUINavigaionControllerLayout() {
            let uINavigationControllerConstraint = [
                uINavigationController.view.topAnchor.constraint(equalTo: view.topAnchor),
                uINavigationController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                uINavigationController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                uINavigationController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ]
            
            NSLayoutConstraint.activate(uINavigationControllerConstraint)
        }
    
    private func setNextButtonLayout() {
           let nextButtonConstraint = [
               nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
           ]
           
           NSLayoutConstraint.activate(nextButtonConstraint)
       }
    
    private func setLayout(){
        setUINavigaionControllerLayout()
        setNextButtonLayout()
    }
}

class NextViewControllerTest: UIViewController {
    
}

@available(iOS 13.0.0, *)
struct UINavigationControllerTestPreView: PreviewProvider {
    static var previews: some View {
        UINavigationControllerTest().toPreview()
    }
}
