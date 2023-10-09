//
//  UISliderTest.swift
//  w3
//
//  Created by 이희주 on 2023/10/09.
//

//slider
import Foundation
import UIKit
import SwiftUI

class UISliderTest: UIViewController {
    private lazy var uISlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        slider.addTarget(self, action: #selector(sliderValChanged), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        return slider
    } ()
    
    @objc func sliderValChanged(_sender: UISlider) {
        let sliderValue = _sender.value
        print("Slider Value: \(sliderValue)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .gray
        self.view.addSubview(self.uISlider)
        
        setLayout()
    }
    
    private func setUISliderLayout() {
        let uISliderConstraint = [
            uISlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uISlider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            uISlider.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0.5)
        ]
        
        NSLayoutConstraint.activate(uISliderConstraint)
    }
    
    private func setLayout(){
        setUISliderLayout()
    }
}

@available(iOS 13.0.0, *)
struct UISliderTestPreView: PreviewProvider {
    static var previews: some View {
        UISliderTest().toPreview()
    }
}
