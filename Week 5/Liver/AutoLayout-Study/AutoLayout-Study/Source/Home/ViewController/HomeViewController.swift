//
//  HomeViewController.swift
//  AutoLayout-Study
//
//  Created by Kyungsoo Lee on 10/19/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    let profileImageWidth: CGFloat = 40
    let profileImageHeight: CGFloat = 40
    let profileStackWidth: CGFloat = 300
    let profileStackHeight: CGFloat = 50
    let nickname: String = "리버"
    let affiliation: String = "GACI"
    
    // MARK: - UI Components
    private lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "INHA-UMC-5th")
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 1
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = profileImageWidth / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var nicknameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.text = "\(nickname)님 안녕하세요."
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var affilationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 35, weight: .bold)
        label.text = "\(affiliation) 지부"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    
    private lazy var profileStack: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(profileImage)
        stackView.addArrangedSubview(nicknameLabel)
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    // MARK: - Set up
    private func setupUI() {
        self.view.addSubview(self.profileStack)
        self.view.addSubview(self.affilationLabel)
        self.view.addSubview(self.uiCollectionView)
        profileImageLayout()
        setProfileStackLayout()
        setAffilationLabelLayout()
        setCollectionViewLayout()
    }
    
    private func profileImageLayout() {
        let profileImageConstraint = [
            self.profileImage.heightAnchor.constraint(equalToConstant: self.profileImageHeight),
            self.profileImage.widthAnchor.constraint(equalToConstant: self.profileImageWidth)
        ]
        NSLayoutConstraint.activate(profileImageConstraint)
    }
    
    private func setProfileStackLayout() {
        let profileStackConstraint = [
            self.profileStack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            self.profileStack.leadingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 10),
            self.profileStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10)
            
        ]
        NSLayoutConstraint.activate(profileStackConstraint)
    }
    
    private func setAffilationLabelLayout() {
        let affilationLabelConstraint = [
            self.affilationLabel.topAnchor.constraint(equalTo: self.profileStack.bottomAnchor, constant: 50),
            self.affilationLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ]
        NSLayoutConstraint.activate(affilationLabelConstraint)
    }
    
    private func setCollectionViewLayout() {
        let collectionViewConstraint = [
            self.uiCollectionView.topAnchor.constraint(equalTo: affilationLabel.bottomAnchor, constant: 50),
            self.uiCollectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.uiCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            self.uiCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
        ]
        NSLayoutConstraint.activate(collectionViewConstraint)
    }

    // MARK: - Button Events
    
    // MARK: - Navigation
    
    // MARK: - Network Manager calls
    
    // MARK: - Extensions
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = uiCollectionView.dequeueReusableCell(withReuseIdentifier: UniversityCell.reuseIdentifier, for: indexPath) as? UniversityCell else {
            fatalError("Failed to dequeue UniversityCell in CalcController")
        }
        cell.configure()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.width / 4 + 76, height: self.view.bounds.width / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

import SwiftUI

@available(iOS 13.0.0, *)
struct HomeViewcontrollerPreview: PreviewProvider {
    static var previews: some View {
        HomeViewController().toPreview()
    }
}
