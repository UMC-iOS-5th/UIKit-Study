//
//  UICollectionViewTest.swift
//  UIKit-Study
//
//  Created by Seungbo Shim on 2023/10/03.
//

import UIKit

class UICollectionViewTest: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // MARK: - UICollectionView
    private lazy var uiCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        // frame을 .zero로 사용하여 CGRect(0, 0, 0, 0)으로 초기화하고, 이후 오토 레이아웃을 통해 layout을 설정한다.
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        // UICollectionView가 속한 컨트롤러에 "UICollectionViewDataSource" 프로토콜을 추가해야 한다.
        // "UICollectionViewDataSource" 프로토콜을 따르기 위해선 collectionView()를 반드시 선언해야 한다.
        collectionView.dataSource = self
        // UICollectionView가 속한 컨트롤러에 "UICollectionViewDelegateFlowLayout" 프로토콜을 추가해야 한다.
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
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
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemGray
        
        // 뷰 추가(아직 layout 설정 안된 상태)
        self.view.addSubview(self.uiCollectionView)
        
        setLayout()
    }
    
    // MARK: - UICollectionView 제약 조건
    private func setUICollectionViewLayout() {
        let uiCollectionViewConstraint = [
            uiCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            uiCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            uiCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
        ]
        NSLayoutConstraint.activate(uiCollectionViewConstraint)
        
    }
    
    // MARK: - 전체 제약조건 설정
    // 컴포넌트들의 레이아웃을 설정한다
    private func setLayout() {
        // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.
        
        // UICollectionView 제약조건 설정
        setUICollectionViewLayout()
    }
}

// UIKit으로 짠 화면을 SwiftUI로 바로 볼 수 있게 해주는 코드
import SwiftUI

@available(iOS 13.0.0, *)
struct UICollectionViewTestControllerPreView: PreviewProvider {
    static var previews: some View {
        UICollectionViewTest().toPreview()
    }
}
