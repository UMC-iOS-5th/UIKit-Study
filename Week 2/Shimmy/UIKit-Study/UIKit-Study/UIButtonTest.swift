////
////  UIButtonTest.swift
////  week2_231003
////
////  Created by Seungbo Shim on 2023/10/03.
////
//
//import QuartzCore
//import UIKit
//
//class UIButtonTest: UIViewController {
//    // MARK: - UIButton
//    private lazy var uiButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("초인종", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.backgroundColor = .white
//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.layer.borderWidth = 2.0
//        button.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
//
//        // 패딩 설정인데.. iOS 15.0 이상부터 안쓴대요
//        let padding: CGFloat = 10.0
//        button.contentEdgeInsets = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
//
//        // 그래서 찾아서 이거 했는데 안됨
//        //button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 8.0, leading: 8.0, bottom: 8.0, trailing: 8.0)
//
//        return button
//    }()
//
//    // MARK: - UIBUtton이 눌렸을 때 호출되는 액션 함수
//    @objc func buttonTapped() {
//        print("띵동")
//    }
//
//    // MARK: - viewDidLoad
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//
//        self.view.backgroundColor = .white
//
//        // 뷰 추가(아직 layout 설정 안된 상태)
//        self.view.addSubview(uiButton)
//
//        setLayout()
//    }
//
//    // MARK: - UIButton 제약조건
//    private func setUIButtonLayout() {
//        let uiButtonConstraint = [
//            // 다른 컴포넌트의 상대적인 위치로 제약조건을 설정할 수도 있다.
//            uiButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            uiButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ]
//        NSLayoutConstraint.activate(uiButtonConstraint)
//    }
//
//    // MARK: - 전체 제약조건 설정
//    // 컴포넌트들의 레이아웃을 설정한다
//    private func setLayout() {
//        // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.
//
//        // UIButton 제약조건 설정
//        setUIButtonLayout()
//    }
//}
//
//import SwiftUI
//
//#if DEBUG
//extension UIViewController {
//    private struct Preview: UIViewControllerRepresentable {
//            let viewController: UIViewController
//
//            func makeUIViewController(context: Context) -> UIViewController {
//                return viewController
//            }
//
//            func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//            }
//        }
//
//        func toPreview() -> some View {
//            Preview(viewController: self)
//        }
//}
//#endif
//
//@available(iOS 13.0.0, *)
//struct UIButtonTestPreView: PreviewProvider {
//    static var previews: some View {
//        UIButtonTest().toPreview()
//    }
//}
