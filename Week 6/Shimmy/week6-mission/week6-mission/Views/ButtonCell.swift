//
//  ButtonCell.swift
//  week6-mission
//
//  Created by Seungbo Shim on 2023/11/07.
//

import UIKit

class ButtonCell: UICollectionViewCell {
    static let identifier = "ButtonCell"
    
    // MARK: - Variables
    private(set) var calculatorButton: CalculatorButton!
    
    // MARK: - UI Components
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 40, weight: .regular)
        label.text = "Error"
        return label
    }()
    
    // MARK: - Configure
    public func configure(with calculatorButton: CalculatorButton) {
        // calculatorButton 모델에서 불러옴
        self.calculatorButton = calculatorButton
        
        // calculatorButton의 title을 titleLabel의 text로
        self.titleLabel.text = calculatorButton.title
        // color를 backgroundColor로
        self.backgroundColor = calculatorButton.color
        self.titleLabel.textColor = .white
        
        self.setupUI()
    }
    
    private func setupUI() {
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        switch self.calculatorButton {
        case let .number(int) where int == 0:
            self.layer.cornerRadius = 36

        default:
            self.layer.cornerRadius = self.frame.size.width/2
        }
        
        
        // 버튼 모양 둥글게 cornerRadius 조절
        //self.layer.cornerRadius = self.frame.size.width/2
        
        // titleLable 위치를 각 버튼의 가운데로 설정
        NSLayoutConstraint.activate([
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.titleLabel.heightAnchor.constraint(equalTo: self.heightAnchor),
            self.titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
        ])
    }
}
