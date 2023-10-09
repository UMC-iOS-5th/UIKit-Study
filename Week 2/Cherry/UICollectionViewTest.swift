//
//  UICollectionViewTest.swift
//  w3
//
//  Created by 이희주 on 2023/10/09.
//

import Foundation
import SwiftUI
import UIKit

class UICollectionViewTest: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    private lazy var uICollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        //must add protocol
        //define collectionView() to add conform protocol
        collectionView.dataSource = self
        //add protocol
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    //protocol 준수하기 위해 필요한 함수들
   //이하 두 함수는 작성하지 않으면 error! (프로토콜 관련 어쩌구...)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 8
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        
        return cell
        }
    
    //이하의 함수는 작성하지 않아도 실행o
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 50, height: 50)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        }
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
            self.view.backgroundColor = .systemGray
            
            // 뷰 추가(아직 layout 설정 안된 상태)
            self.view.addSubview(self.uICollectionView)
            
            setLayout()
        }
    
    private func setUICollectionViewLayout() {
           let uICollectionViewConstraint = [
               uICollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               uICollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
               uICollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
               uICollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
           ]
           NSLayoutConstraint.activate(uICollectionViewConstraint)
           
       }
       
       // MARK: - 전체 제약조건 설정
       // 컴포넌트들의 레이아웃을 설정한다
       private func setLayout() {
           // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.
           
           // UICollectionView 제약조건 설정
           setUICollectionViewLayout()
       }
}


@available(iOS 13.0.0, *)
struct UICollectionViewTestControllerPreView: PreviewProvider {
    static var previews: some View {
        UICollectionViewTest().toPreview()
    }
}
