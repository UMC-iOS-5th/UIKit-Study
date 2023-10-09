//
//  UITabBarControllerTest.swift
//  w3
//
//  Created by 이희주 on 2023/10/09.
//

import Foundation
import UIKit
import SwiftUI

class UITabBarControllerTest: UIViewController {
    private lazy var firstTabView : UIViewController = {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .gray
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        return viewController
    } ()
    
    private lazy var secondTabView : UIViewController = {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemPink
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        return viewController
    } ()
    
    private lazy var thirdTabView : UIViewController = {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .brown
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        return viewController
    } ()
    
    private lazy var myTabBarController: UITabBarController = {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [firstTabView, secondTabView, thirdTabView]
        tabBarController.view.translatesAutoresizingMaskIntoConstraints = false
        
        return tabBarController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .gray
        addChild(myTabBarController)
        self.view.addSubview(myTabBarController.view)
        myTabBarController.didMove(toParent: self)
        
        setLayout()
    }
    
    private func setTabBarLayout(){
        let tabBarControlConstraint = [
            myTabBarController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myTabBarController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myTabBarController.view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier : 0.5),
            myTabBarController.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ]
        
        NSLayoutConstraint.activate(tabBarControlConstraint)
    }
    
    private func setLayout(){
        setTabBarLayout()
    }
}

@available(iOS 13.0.0, *)
struct CumstomTabBarControllerTestPreview: PreviewProvider {
    static var previews: some View {
        UITabBarControllerTest().toPreview()
    }
}
