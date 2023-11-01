//
//  LoginViewController.swift
//  UIkit-Study
//
//  Created by Junhyuk Boo on 10/30/23.
//

import UIKit
import SwiftUI

class LoginViewController: UIViewController {
    
    private lazy var uiLable: UILabel = {
            let label = UILabel()
            //label.text = "INHA\nUMC"
            label.textAlignment = .center
            //label.font = UIFont.boldSystemFont(ofSize: 50)
            label.textColor = .black
            label.backgroundColor = .white
            label.numberOfLines = 0// 줄바꿈에필요
            label.translatesAutoresizingMaskIntoConstraints = false
        
        
            // NSAttributedString을 사용하여 다른 폰트와 크기로 텍스트 설정
            let inhaAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 50),
                .foregroundColor: UIColor.black
            ]

            let umcAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.boldSystemFont(ofSize: 70),
                .foregroundColor: UIColor.black
            ]

            let attributedText = NSMutableAttributedString(string: "INHA\n", attributes: inhaAttributes)
            attributedText.append(NSAttributedString(string: "UMC", attributes: umcAttributes))
            
            label.attributedText = attributedText
            
        
            return label
        }()
    
    private lazy var uiImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "INHA-UMC-5th")
            imageView.contentMode = .scaleAspectFit
            imageView.alpha = 1
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            //imageView.layer.cornerRadius = imageView.frame.size.width / 2
            imageView.clipsToBounds = true
            return imageView
        }()
    
    private lazy var signupLable: UILabel = {
        let label = UILabel()
        label.text = "Sign up or log in"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = .black
        label.backgroundColor = .yellow
        // label.numberOfLines = 0// 줄바꿈에필요
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    private lazy var uiNavigationController: UINavigationController = {
//            // RootView
//            let rootViewController = UIViewController()
//            rootViewController.view.backgroundColor = .green
//            rootViewController.title = "Root View 라고요 ?"
//        
//            let navigationController = UINavigationController(rootViewController: rootViewController)
//        
//            navigationController.view.translatesAutoresizingMaskIntoConstraints = false
//            
//            return navigationController
//        }()
//    private lazy var nextButton: UIButton = {
//            let button = UIButton()
//            button.setTitle("Nextㅇ이ㅣ이머;ㅣ아ㅓ", for: .normal)
//            button.setTitleColor(.blue, for: .normal)
//            button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
//            button.translatesAutoresizingMaskIntoConstraints = false
//            return button
//        }()
        
//        @objc private func nextButtonTapped() {
//            let destinationViewController = NextViewControllerTest()
//            navigationController?.pushViewController(destinationViewController, animated: true)
//        }
    
//    private lazy var titleView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .yellow
//        view.translatesAutoresizingMaskIntoConstraints = false
//        
//        return view
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view.layer.cornerRadius = uiImageView.frame.size.width / 2

        //uiImageView.layer.cornerRadius = uiImageView.frame.size.width / 2
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        self.view.addSubview(uiLable)
        self.view.addSubview(uiImageView)
        self.view.addSubview(signupLable)
        
        //self.view.addSubview(uiNavigationController.view)
                // 네비게이션 컨트롤러에 루트 뷰 컨트롤러를 추가
        //addChild(uiNavigationController)
        //uiNavigationController.didMove(toParent: self)
                
        //view.addSubview(nextButton)
        
        setLayout()
    }
    
    private func setUILableLayout() {
        let uiLabelConstraint = [
            uiLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiLable.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -230)
        ]
        
        NSLayoutConstraint.activate(uiLabelConstraint)
    }
    private func setUIImageViewLayout() {
            let uiImageViewConstraint = [
                
                uiImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                uiImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                uiImageView.widthAnchor.constraint(equalToConstant: 200), // 너비
                uiImageView.heightAnchor.constraint(equalToConstant: 200) // 높이
            ]
            NSLayoutConstraint.activate(uiImageViewConstraint)
        }
    
    private func setsignupLableLayout() {
        let signupLableConstraints = [
            signupLable.centerXAnchor.constraint(equalTo: self.uiImageView.centerXAnchor),
            signupLable.topAnchor.constraint(equalTo: self.uiImageView.bottomAnchor, constant: 20)
        ]
        
        NSLayoutConstraint.activate(signupLableConstraints)
    }
    
//    private func setUINavigaionControllerLayout() {
//            let uiNavigationControllerConstraint = [
//                uiNavigationController.view.topAnchor.constraint(equalTo: view.topAnchor),
//                uiNavigationController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//                uiNavigationController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//                uiNavigationController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//            ]
//            
//            NSLayoutConstraint.activate(uiNavigationControllerConstraint)
//        }
//        
//        // MARK: - NextButtonLayout 제약 조건
//    private func setNextButtonLayout() {
//            let nextButtonConstraint = [
//                nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200)
//            ]
//            
//            NSLayoutConstraint.activate(nextButtonConstraint)
//        }
    private func setLayout() {
        setUILableLayout()
        setUIImageViewLayout()
        setsignupLableLayout()
        // UINavigationController 제약조건 설정
        //setUINavigaionControllerLayout()
        // setNexxtButton 제약조건 설정(UINavigationController)
        //setNextButtonLayout()
    }
//    class NextViewControllerTest: UIViewController {
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            view.backgroundColor = .gray
//            title = "Next View"
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


@available(iOS 13.0.0, *)
struct LoginViewControllerPreview: PreviewProvider {
    static var previews: some View {
        LoginViewController().toPreview()
    }
}
