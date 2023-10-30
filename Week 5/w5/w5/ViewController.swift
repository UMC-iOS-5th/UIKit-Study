//
//  ViewController.swift
//  w5
//
//  Created by 이희주 on 2023/10/24.
//

// UIKit으로 짠 화면을 SwiftUI로 바로 볼 수 있게 해주는 코드
import UIKit
import SwiftUI

#if DEBUG
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
            let viewController: UIViewController

            func makeUIViewController(context: Context) -> UIViewController {
                return viewController
            }

            func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            }
        }

        func toPreview() -> some View {
            Preview(viewController: self)
        }
}
#endif

@available(iOS 13.0.0, *)
struct ViewControllerPreView: PreviewProvider {
    static var previews: some View {
        ViewController().toPreview()
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
