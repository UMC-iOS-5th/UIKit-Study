//
//  UniversityCell.swift
//  AutoLayout-Study
//
//  Created by Kyungsoo Lee on 10/19/23.
//

import UIKit

class UniversityCell: UICollectionViewCell  {
    static let reuseIdentifier = "UniversityCell"
    
    // MARK: - Variables
    
    // MARK: - UI Components
    private lazy var universityUIButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "OO대"
        config.baseForegroundColor = .black
        config.baseBackgroundColor = .white
        config.background.strokeWidth = 1.0
        config.background.strokeColor = .white
        config.cornerStyle = .fixed
        config.titleAlignment = .center
        
        if let image = UIImage(named: "INHA-UMC-5th") {
            let resizeImage = image.resizeImage(image: image, toSize: CGSize(width: 150, height: 150))
            config.image = resizeImage?.setCornerRadius(with: 15)
            config.imagePlacement = .top
            config.imagePadding = 10
        }
        
        let button = UIButton(configuration: config, primaryAction: nil)
        button.addTarget(self, action: #selector(ButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc func ButtonTapped() {
        print("button tapped")
    }
    
    // MARK: - Configure
    public func configure() {
        
        self.setupUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.addSubview(self.universityUIButton)
    }
}
