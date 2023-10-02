////
////  UILabelTest.swift
////  week2_231003
////
////  Created by Seungbo Shim on 2023/10/03.
////
//
//import UIKit
//
//class UILabelTest: UIViewController {
//    // MARK: - UILable
//    private lazy var uiLabel: UILabel = {
//        let label = UILabel()
//        label.text = "BLACKPINK\nIN\nYOUR\nAREA"
//        label.textAlignment = .left
//        label.font = UIFont.boldSystemFont(ofSize: 32)
//        label.textColor = .magenta
//        label.backgroundColor = .darkGray
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.numberOfLines = 0
//        return label
//    }()
//
//    // MARK: - viewDidLoad
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//
//        self.view.backgroundColor = .white
//
//        // 뷰 추가(아직 layout 설정 안된 상태)
//        self.view.addSubview(uiLabel)
//
//        setLayout()
//    }
//
//    // MARK: - UILabel 제약조건
//    private func setUILableLayout() {
//        let uiLabelConstraint = [
//            uiLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            uiLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ]
//
//        // 제약 조건을 활성화 시켜 오토 레이아웃 설정한다.
//        NSLayoutConstraint.activate(uiLabelConstraint)
//        /*
//         위 방식과 동일한 코드(서로 방식만 다름)
//         uiLable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//         uiLable.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//         */
//    }
//
//    // MARK: - 전체 제약조건 설정
//    // 컴포넌트들의 레이아웃을 설정한다
//    private func setLayout() {
//        // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.
//
//        // UILabel 제약조건 설정
//        setUILableLayout()
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
//struct UILabelTestPreView: PreviewProvider {
//    static var previews: some View {
//        UILabelTest().toPreview()
//    }
//}
