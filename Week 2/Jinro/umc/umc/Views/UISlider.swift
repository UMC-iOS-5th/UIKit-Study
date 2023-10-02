import UIKit

class UISliderTest: UIViewController {
    
    private lazy var uiSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 150
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        return slider
    }()
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        let sliderValue = sender.value
        print("Slider Value: \(sliderValue)")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = .systemGray
        
        self.view.addSubview(self.uiSlider)
        
        setLayout()
    }
    
    private func setUISliderLayout() {
        let uiSliderConstraint = [
            uiSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiSlider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            uiSlider.widthAnchor.constraint(equalToConstant: 200)
        ]
        NSLayoutConstraint.activate(uiSliderConstraint)
        
    }
    
    private func setLayout() {

        setUISliderLayout()
    }
}


import SwiftUI

@available(iOS 13.0.0, *)
struct UISliderTestPreView: PreviewProvider {
    static var previews: some View {
        UISliderTest().toPreview()
    }
}
