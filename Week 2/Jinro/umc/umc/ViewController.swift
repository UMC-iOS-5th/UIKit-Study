//
//  ViewController.swift
//  umc
//
//  Created by gourderased on 2023/10/02.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

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

import SwiftUI
@available(iOS 13.0.0, *)
struct ViewControllerPreView: PreviewProvider {
    static var previews: some View {
        ViewController().toPreview()
    }
}
