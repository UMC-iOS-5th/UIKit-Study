import UIKit

class UIImageViewTest: UIViewController {

    private lazy var uiImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "INHA-UMC-5th")
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0.5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray
        
        self.view.addSubview(uiImageView)
        
        setLayout()
    }
    private func setUIImageViewLayout() {
        let uiImageViewConstraint = [
            uiImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            uiImageView.widthAnchor.constraint(equalToConstant: 200), // 너비 제약 조건 추가
            uiImageView.heightAnchor.constraint(equalToConstant: 200) // 높이 제약 조건 추가
        ]
        NSLayoutConstraint.activate(uiImageViewConstraint)
    }
    private func setLayout() {
        setUIImageViewLayout()
    }
}

import SwiftUI

@available(iOS 13.0.0, *)
struct UIImageViewTestControllerPreView: PreviewProvider {
    static var previews: some View {
        UIImageViewTest().toPreview()
    }
}
