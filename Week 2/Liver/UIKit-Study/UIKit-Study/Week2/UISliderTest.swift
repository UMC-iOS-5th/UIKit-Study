//
//  UISliderTest.swift
//  UIKit-Study
//
//  Created by Kyungsoo Lee on 2023/09/30.
//

import UIKit

class UISliderTest: UIViewController {
    // MARK: - UISlider
    
    private lazy var uiSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        return slider
    }()
    
    // MARK: - UISlider 값을 변경할 때 호출되는 액션 함수
    @objc func sliderValueChanged(_ sender: UISlider) {
        let sliderValue = sender.value
        print("Slider Value: \(sliderValue)")
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemGray
        
        // 뷰 추가(아직 layout 설정 안된 상태)

        self.view.addSubview(self.uiSlider)
        
        setLayout()
    }
    
    // MARK: - UISlider 제약 조건
    private func setUISliderLayout() {
        let uiSliderConstraint = [
            uiSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiSlider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            uiSlider.widthAnchor.constraint(equalToConstant: 200)
        ]
        NSLayoutConstraint.activate(uiSliderConstraint)
        
    }
    
    // MARK: - 전체 제약조건 설정
    // 컴포넌트들의 레이아웃을 설정한다
    private func setLayout() {
        // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.
        
        // UISlider 제약조건 설정
        setUISliderLayout()
    }
}

// UIKit으로 짠 화면을 SwiftUI로 바로 볼 수 있게 해주는 코드
import SwiftUI

@available(iOS 13.0.0, *)
struct UISliderTestPreview: PreviewProvider {
    static var previews: some View {
        UISliderTest().toPreview()
    }
}
