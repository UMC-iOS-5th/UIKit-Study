//
//  CustomTabBarControllerTest.swift
//  UIKit-Study
//
//  Created by Seungbo Shim on 2023/10/03.
//

import UIKit

class CustomTabBarControllerTest: UIViewController {
    // MARK: - UITabBarController
    // FirstTabView
    private lazy var firstViewController: UIViewController = {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .lightGray
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        return viewController
    }()

    
    // SecondTabView
    private lazy var secondViewController: UIViewController = {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .gray
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return viewController
    }()
    
    // ThirdTabView
    private lazy var thirdViewController: UIViewController = {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .darkGray
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        
        return viewController
    }()
    
    // TabBarConroller
    private lazy var customTabBarController: UITabBarController = {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [firstViewController, secondViewController, thirdViewController]
        tabBarController.view.translatesAutoresizingMaskIntoConstraints = false
        
        return tabBarController
    }()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemGray
        
        // 뷰 추가(아직 layout 설정 안된 상태)
        
        // 현재의 ViewController에 tabBarController를 추가하는 부분
        // 현재 뷰의 자식으로 customTabBarController를 등록한다.
        addChild(customTabBarController)
        self.view.addSubview(customTabBarController.view)
        customTabBarController.didMove(toParent: self)
        
        setLayout()
    }
    // MARK: - CustomTabBarControllerLayout 제약 조건
    private func setTabBarControllerLayout() {
        // tabBarController의 레이아웃을 설정하는 코드를 여기에 추가해
        // 예를 들어, 아래는 tabBarController를 현재 뷰 컨트롤러의 view에 꽉 차게 설정하는 코드야
        let tabBarControllerConstraint = [
            customTabBarController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customTabBarController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            customTabBarController.view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            customTabBarController.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ]
        
        NSLayoutConstraint.activate(tabBarControllerConstraint)
    }
    
    // MARK: - 전체 제약조건 설정
    // 컴포넌트들의 레이아웃을 설정한다
    private func setLayout() {
        // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.
        
        // TabBarController 제약조건 설정
        setTabBarControllerLayout()
    }
}

// UIKit으로 짠 화면을 SwiftUI로 바로 볼 수 있게 해주는 코드
import SwiftUI

@available(iOS 13.0.0, *)
struct CumstomTabBarControllerTestPreview: PreviewProvider {
    static var previews: some View {
        CustomTabBarControllerTest().toPreview()
    }
}
