//
//  MainViewController.swift
//  week5-mission
//
//  Created by Seungbo Shim on 2023/10/30.
//

import UIKit
import SwiftUI

class MainViewController: UIViewController {
    // MARK: - Components
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "INHA"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 28)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
       let label = UILabel()
        label.text = "UMC"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 56)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var logoView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "INHA-UMC-5th")
        imageView.layer.cornerRadius = 30
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign up or log in"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var AppleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue with Apple", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(appleButtonTapped), for: .touchUpInside)
        button.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.borderWidth = 2.0
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var GoogleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue with Google", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(googleButtonTapped), for: .touchUpInside)
        button.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.borderWidth = 2.0
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func appleButtonTapped() {
        print("Apple login")
    }
    
    @objc func googleButtonTapped() {
        print("Google login")
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    // MARK: - Set up
    private func setupUI() {
        self.view.backgroundColor = .white
        // self.view 는 전체 view(부모)
        // 전체 view에 각각의 view를 추가
        // 추가한 순서대로 z 값이 정해짐 (나중에 넣은 black이 제일 위로 감)
        self.view.addSubview(titleLabel)
        self.view.addSubview(subTitleLabel)
        self.view.addSubview(logoView)
        self.view.addSubview(loginLabel)
        self.view.addSubview(AppleButton)
        self.view.addSubview(GoogleButton)
        // 각각 뷰에 오토레이아웃 함수 호출
        setTitleLabelLayout()
        setSubTitleLabelLayout()
        setLogoViewLayout()
        setLoginLabelLayout()
        setAppleButtonLayout()
        setGoogleButtonLayout()
    }
    
    private func setTitleLabelLayout() {
        let titleLabelConstraint = [
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.subTitleLabel.topAnchor),
        ]
        NSLayoutConstraint.activate(titleLabelConstraint)
    }
    
    private func setSubTitleLabelLayout() {
        let subTitleLabelConstraint = [
            self.subTitleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            //self.subTitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            self.subTitleLabel.bottomAnchor.constraint(equalTo: self.logoView.topAnchor, constant: -80)
        ]
        NSLayoutConstraint.activate(subTitleLabelConstraint)
    }
    
    private func setLogoViewLayout() {
        let logoViewConstant = [
            self.logoView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.logoView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.logoView.widthAnchor.constraint(equalToConstant: 200),
            self.logoView.heightAnchor.constraint(equalToConstant: 200),
        ]
        NSLayoutConstraint.activate(logoViewConstant)
    }
    
    private func setLoginLabelLayout() {
        let loginLabelConstraint = [
            self.loginLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.loginLabel.topAnchor.constraint(equalTo: self.logoView.bottomAnchor, constant: 80),
        ]
        NSLayoutConstraint.activate(loginLabelConstraint)
    }
    
    private func setAppleButtonLayout() {
        let appleButtonConstraint = [
            self.AppleButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.AppleButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -50),
            self.AppleButton.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 20)
        ]
        NSLayoutConstraint.activate(appleButtonConstraint)
    }
    
    private func setGoogleButtonLayout() {
        let googleButtonConstraint = [
            self.GoogleButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.GoogleButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -50),
            self.GoogleButton.topAnchor.constraint(equalTo: self.AppleButton.bottomAnchor, constant: 10)
        ]
        NSLayoutConstraint.activate(googleButtonConstraint)
    }
}

// MARK: - Extension
extension UIImage {
        // UIButton에 UIImage를 넣을 때, 이미지의 크기를 조정하는 함수
    func resizeImage(image: UIImage, toSize size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        image.draw(in: CGRect(origin: CGPoint.zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
    
        // UIImage의 cornerRadius를 설정할 수 있도록 해주는 함수
    func setCornerRadius(with radius: CGFloat) -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.scale = scale
        let renderer = UIGraphicsImageRenderer(size: size, format: format)
        return renderer.image { rendererContext in
            let rect = CGRect(origin: .zero, size: size)
            let path = UIBezierPath(roundedRect: rect,
                                    byRoundingCorners: .allCorners,
                                    cornerRadii: CGSize(width: radius, height: radius))
            path.close()
            
            let cgContext = rendererContext.cgContext
            cgContext.saveGState()
            path.addClip()
            draw(in: rect)
            cgContext.restoreGState()
        }
    }
}


@available(iOS 13.0.0, *)
struct MainViewControllerPreview: PreviewProvider {
    static var previews: some View {
        MainViewController().toPreview()
    }
}
