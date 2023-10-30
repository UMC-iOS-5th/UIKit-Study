import UIKit

class CustomTabBarControllerTest: ViewController {
    private lazy var firstViewController: UIViewController = {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .lightGray
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0)
        
        return viewController
    }()

    private lazy var secondViewController: UIViewController = {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .gray
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        
        return viewController
    }()
    
    private lazy var thirdViewController: UIViewController = {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .darkGray
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        
        return viewController
    }()
    
    private lazy var customTabBarController: UITabBarController = {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [firstViewController, secondViewController, thirdViewController]
        tabBarController.view.translatesAutoresizingMaskIntoConstraints = false
        
        return tabBarController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray
        
        addChild(customTabBarController)
        view.addSubview(customTabBarController.view)
        customTabBarController.didMove(toParent: self)
        
        setLayout()
    }

    private func setTabBarControllerLayout() {

        let tabBarControllerConstraint = [
            customTabBarController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customTabBarController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            customTabBarController.view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            customTabBarController.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ]
        
        NSLayoutConstraint.activate(tabBarControllerConstraint)
    }
    
    private func setLayout() {

        setTabBarControllerLayout()
    }
}

// UIKit으로 짠 화면을 SwiftUI로 바로 볼 수 있게 해주는 코드
import SwiftUI

@available(iOS 13.0.0, *)
struct CumstomTabBarControllerTestPreView: PreviewProvider {
    static var previews: some View {
        CustomTabBarControllerTest().toPreview()
    }
}
