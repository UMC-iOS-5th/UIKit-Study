//
//  UISegmentedControlTest.swift
//  UIKit-Study
//
//  Created by Kyungsoo Lee on 2023/09/30.
//

import UIKit

class UISegmentedControlTest: UIViewController {
    // MARK: - UISegmentedControl
    private lazy var uiSegmentedControl: UISegmentedControl = {
        let items = ["Item 1", "Item 2", "Item 3"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    // MARK: - UISegmentedControl이 눌렸을 때 호출되는 액션 함수
    @objc func segmentedControlValueChanged() {
        let selectedSegmentIndex = uiSegmentedControl.selectedSegmentIndex
        print("Selected Segment Index: \(selectedSegmentIndex)")
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemGray
        
        // 뷰 추가(아직 layout 설정 안된 상태)
        self.view.addSubview(self.uiSegmentedControl)
        
        setLayout()
    }
    
    // MARK: - UISegmentedControl
    private func setUISegmentedControlLayout() {
        let uiSegmentedControlConstraint = [
            uiSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiSegmentedControl.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        NSLayoutConstraint.activate(uiSegmentedControlConstraint)
    }
    // MARK: - 전체 제약조건 설정
    // 컴포넌트들의 레이아웃을 설정한다
    private func setLayout() {
        // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.
        
        // UISegmentedControl 제약조건 설정
        setUISegmentedControlLayout()
    }
}

// UIKit으로 짠 화면을 SwiftUI로 바로 볼 수 있게 해주는 코드
import SwiftUI

@available(iOS 13.0.0, *)
struct UISegmentControlTestPreView: PreviewProvider {
    static var previews: some View {
        UISegmentedControlTest().toPreview()
    }
}
