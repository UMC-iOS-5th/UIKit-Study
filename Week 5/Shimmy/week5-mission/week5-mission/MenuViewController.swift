//
//  MenuViewController.swift
//  week5-mission
//
//  Created by Seungbo Shim on 2023/10/31.
//

import UIKit
import SwiftUI

class UniversityCell: UICollectionViewCell {
    static let reuseIdentifier = "UniversityCell"
    
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
        print("뿅")
    }
}

class MenuViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // MARK: - Components
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "GACI 지부"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    
    private lazy var logoView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "INHA-UMC-5th")
        imageView.layer.cornerRadius = 30
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var uiCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UniversityCell.self, forCellWithReuseIdentifier: UniversityCell.reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    // MARK: - UICollectionViewDataSource 메서드
    // 특정 섹션에 속하는 아이템(셀)의 총 개수를 반환한다.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    // 각 셀을 생성하고 구성하기 위해 호출
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // dequeueReusableCell()을 통해 재사용 가능한 셀을 얻는다. 셀이 없으면 재사용 큐에 셀을 생성한다.
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    // CollectionView에 들어갈 Item에 size에 대한 정보
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    // CollectionView에 들어갈 셀 사이의 minimum spacing에 대한 정보
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // CollectionView에 들어갈 각 Item의 Inset(여백) 대한 정보
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
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
        self.view.addSubview(uiCollectionView)

        // 각각 뷰에 오토레이아웃 함수 호출
        setTitleLabelLayout()
        setUICollectionViewLayout()

    }
    
    private func setTitleLabelLayout() {
        let titleLabelConstraint = [
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.uiCollectionView.topAnchor),
        ]
        NSLayoutConstraint.activate(titleLabelConstraint)
    }
    
    

    private func setUICollectionViewLayout() {
        let uiCollectionViewContraint = [
            self.uiCollectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.uiCollectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ]
        NSLayoutConstraint.activate(uiCollectionViewContraint)
    }
}


@available(iOS 13.0.0, *)
struct MenuViewControllerPreview: PreviewProvider {
    static var previews: some View {
        MenuViewController().toPreview()
    }
}
