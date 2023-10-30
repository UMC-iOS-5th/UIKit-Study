import UIKit

class UISegmentedControlTest: UIViewController {
    // MARK: - UISegmentedControl
    private lazy var uiSegmentedControl: UISegmentedControl = {
        let items = ["유린기", "깐풍기", "탕수육"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    @objc func segmentedControlValueChanged() {
        let selectedSegmentIndex = uiSegmentedControl.selectedSegmentIndex
        print("Selected Segment Index: \(selectedSegmentIndex)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemGray
        
        self.view.addSubview(self.uiSegmentedControl)
        
        setLayout()
    }

    private func setUISegmentedControlLayout() {
        let uiSegmentedControlConstraint = [
            uiSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiSegmentedControl.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        NSLayoutConstraint.activate(uiSegmentedControlConstraint)
    }
    private func setLayout() {

        setUISegmentedControlLayout()
    }
}

import SwiftUI

@available(iOS 13.0.0, *)
struct UISegmentControlTestPreView: PreviewProvider {
    static var previews: some View {
        UISegmentedControlTest().toPreview()
    }
}
