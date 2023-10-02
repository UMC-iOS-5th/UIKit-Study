//
//  UINavigationControllerTest.swift
//  UIKit-Study
//
//  Created by Kyungsoo Lee on 2023/10/01.
//

import UIKit

class UINavigationControllerTest: UIViewController {
    // MARK: - UINavigationController
    private lazy var uiNavigationController: UINavigationController = {
        // RootView
        let rootViewController = UIViewController()
        rootViewController.view.backgroundColor = .white
        rootViewController.title = "Root View"
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.view.translatesAutoresizingMaskIntoConstraints = false
        
        return navigationController
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func nextButtonTapped() {
        let destinationViewController = NextViewControllerTest()
        navigationController?.pushViewController(destinationViewController, animated: true)
    }

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemGray
        
        // 뷰 추가(아직 layout 설정 안된 상태)
        self.view.addSubview(uiNavigationController.view)
        // 네비게이션 컨트롤러에 루트 뷰 컨트롤러를 추가
        addChild(uiNavigationController)
        uiNavigationController.didMove(toParent: self)
        
        view.addSubview(nextButton)

        
        setLayout()
    }
    
    // MARK: - UINavigaionControllerLayout 제약 조건
    private func setUINavigaionControllerLayout() {
        let uiNavigationControllerConstraint = [
            uiNavigationController.view.topAnchor.constraint(equalTo: view.topAnchor),
            uiNavigationController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            uiNavigationController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            uiNavigationController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(uiNavigationControllerConstraint)
    }
    
    // MARK: - NextButtonLayout 제약 조건
    private func setNextButtonLayout() {
        let nextButtonConstraint = [
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(nextButtonConstraint)
    }
    
    // MARK: - 전체 제약조건 설정
    // 컴포넌트들의 레이아웃을 설정한다
    private func setLayout() {
        // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.
        
        // UINavigationController 제약조건 설정
        setUINavigaionControllerLayout()
        // setNexxtButton 제약조건 설정(UINavigationController)
        setNextButtonLayout()
    }
}

class NextViewControllerTest: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        title = "Next View"
    }
}

// UIKit으로 짠 화면을 SwiftUI로 바로 볼 수 있게 해주는 코드
import SwiftUI

@available(iOS 13.0.0, *)
struct UINavigationControllerTestPreview: PreviewProvider {
    static var previews: some View {
        UINavigationControllerTest().toPreview()
    }
}
