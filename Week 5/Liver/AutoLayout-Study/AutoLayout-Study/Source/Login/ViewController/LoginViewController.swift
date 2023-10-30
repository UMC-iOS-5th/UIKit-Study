//
//  LoginViewController.swift
//  AutoLayout-Study
//
//  Created by Kyungsoo Lee on 10/17/23.
//

import Foundation

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    let logoImageWidth: CGFloat = 200
    let logoImageHeight: CGFloat = 200
    let loginButtonWidth: CGFloat = 300
    let loginButtonHeight: CGFloat = 35
    
    // MARK: - UI Components
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .regular)
        label.text = "INHA"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 60, weight: .bold)
        label.text = "UMC"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "INHA-UMC-5th")
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 1
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = self.logoImageWidth / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var signlabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.text = "Sign up or log in"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var appleButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Continue with Apple"
        config.baseForegroundColor = .black
        config.baseBackgroundColor = .white
        config.background.strokeWidth = 1.0
        config.background.strokeColor = .black
        config.cornerStyle = .fixed
        config.titleAlignment = .center
        
        if let image = UIImage(named: "Apple-logo") {
            let resizeImage = image.resizeImage(image: image, toSize: CGSize(width: self.loginButtonHeight * 0.75, height: self.loginButtonHeight * 0.75))
            config.image = resizeImage
            config.imagePlacement = .leading
            config.imagePadding = self.loginButtonWidth * 0.1
        }
        
        let button = UIButton(configuration: config, primaryAction: nil)
        button.addTarget(self, action: #selector(googleButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc func appleButtonTapped() {
        print("Apple Login")
    }
    
    private lazy var googleButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Continue with Google"
        config.baseForegroundColor = .black
        config.baseBackgroundColor = .white
        config.background.strokeWidth = 1.0
        config.background.strokeColor = .black
        config.cornerStyle = .fixed
        config.titleAlignment = .center
        
        if let image = UIImage(named: "Google-logo") {
            let resizeImage = image.resizeImage(image: image, toSize: CGSize(width: self.loginButtonHeight * 0.75, height: self.loginButtonHeight * 0.75))
            config.image = resizeImage
            config.imagePlacement = .leading
            config.imagePadding = self.loginButtonWidth * 0.1
        }
        
        let button = UIButton(configuration: config, primaryAction: nil)
        button.addTarget(self, action: #selector(googleButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc func googleButtonTapped() {
        print("Google Login.")
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    // MARK: - Set up
    private func setupUI() {
        self.view.addSubview(self.subTitleLabel)
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.logoImage)
        self.view.addSubview(self.signlabel)
        self.view.addSubview(self.appleButton)
        self.view.addSubview(self.googleButton)
        setSubTitleLabelLayout()
        setTitleLabelLayout()
        setLogoImageLayout()
        setSignLabelLayout()
        setAppleButtonLayout()
        setGoogleButtonLayout()
    }
    
    private func setSubTitleLabelLayout() {
        let subTitleLabelConstaint = [
            self.subTitleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50),
            self.subTitleLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            self.subTitleLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(subTitleLabelConstaint)
    }
    
    private func setTitleLabelLayout() {
        let titleLabelConstaint = [
            self.titleLabel.topAnchor.constraint(equalTo: self.subTitleLabel.bottomAnchor, constant: -10),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(titleLabelConstaint)
    }
    
    private func setLogoImageLayout() {
        let logoImageConstraint = [
            self.logoImage.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 100),
            self.logoImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.logoImage.widthAnchor.constraint(equalToConstant: self.logoImageWidth),
            self.logoImage.heightAnchor.constraint(equalToConstant: self.logoImageHeight)
        ]
        NSLayoutConstraint.activate(logoImageConstraint)
    }
    
    private func setSignLabelLayout() {
        let signLabelConstraint = [
            self.signlabel.topAnchor.constraint(equalTo: self.logoImage.bottomAnchor, constant: 100),
            self.signlabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ]
        NSLayoutConstraint.activate(signLabelConstraint)
    }
    
    private func setAppleButtonLayout() {
        let appleButtonConstraint = [
            self.appleButton.topAnchor.constraint(equalTo: self.signlabel.bottomAnchor, constant: 20),
            self.appleButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.appleButton.widthAnchor.constraint(equalToConstant: self.loginButtonWidth),
            self.appleButton.heightAnchor.constraint(equalToConstant: self.loginButtonHeight)
        ]
        NSLayoutConstraint.activate(appleButtonConstraint)
    }
    
    private func setGoogleButtonLayout() {
        let GoogleButtonConstraint = [
            self.googleButton.topAnchor.constraint(equalTo: self.appleButton.bottomAnchor, constant: 10),
            self.googleButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.googleButton.widthAnchor.constraint(equalToConstant: self.loginButtonWidth),
            self.googleButton.heightAnchor.constraint(equalToConstant: self.loginButtonHeight)
        ]
        NSLayoutConstraint.activate(GoogleButtonConstraint)
    }
    
    // MARK: - Button Events
    
    // MARK: - Navigation
    
    // MARK: - Network Manager calls
    
    // MARK: - Extensions
    
}

import SwiftUI

@available(iOS 13.0.0, *)
struct LoginViewcontrollerPreview: PreviewProvider {
    static var previews: some View {
        LoginViewController().toPreview()
    }
}
