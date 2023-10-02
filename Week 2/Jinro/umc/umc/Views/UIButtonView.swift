import UIKit

class UIButtonTest: UIViewController {

    private lazy var uiButton: UIButton = {
        let button = UIButton()
        button.setTitle("UIBUUUTTTON", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10.0
        
        return button
    }()

    @objc func buttonTapped() {
        print("버튼이 눌렸습니다.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray

        self.view.addSubview(uiButton)
        
        setLayout()
    }

    private func setUIButtonLayout() {
        let uiButtonConstraint = [

            uiButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        NSLayoutConstraint.activate(uiButtonConstraint)
    }


    private func setLayout() {
        setUIButtonLayout()
    }
}

import SwiftUI

@available(iOS 13.0.0, *)
struct UIButtonTestPreView: PreviewProvider {
    static var previews: some View {
        UIButtonTest().toPreview()
    }
}
