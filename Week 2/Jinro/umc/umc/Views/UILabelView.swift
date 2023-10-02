import UIKit

class UILabelTest: UIViewController {

    private lazy var uiLable: UILabel = {
        let label = UILabel()
        label.text = "JINRO \n AO riversichi"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = .white
        label.backgroundColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        
        return label
    }()

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemGray
        
        // 뷰 추가(아직 layout 설정 안된 상태)
        self.view.addSubview(uiLable)
        
        setLayout()
    }

    // MARK: - UILabel 제약조건
    private func setUILableLayout() {
        let uiLabelConstraint = [
            uiLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiLable.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        // 제약 조건을 활성화 시켜 오토 레이아웃 설정한다.
        NSLayoutConstraint.activate(uiLabelConstraint)
        /*
         위 방식과 동일한 코드(서로 방식만 다름)
         uiLable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         uiLable.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
         */
    }

    // MARK: - 전체 제약조건 설정
    // 컴포넌트들의 레이아웃을 설정한다
    private func setLayout() {
        // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.
        
        // UILabel 제약조건 설정
        setUILableLayout()
    }
}

import SwiftUI

@available(iOS 13.0.0, *)
struct UILabelTestPreView: PreviewProvider {
    static var previews: some View {
        UILabelTest().toPreview()
    }
}
