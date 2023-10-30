//
//  WorkbookViewController.swift
//  week5-practice
//
//  Created by Seungbo Shim on 2023/10/24.
//

import UIKit
import SwiftUI

class WorkbookViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var redView: UIView = {
    // lazy (늦은 초기화) : 밖에서 선언한 변수를 갖다 써야하니까 내가 그거 선언되고 나서 초기화 할래
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        // autolayout 쓸때 컴포넌트마다 꼭 넣기
        
        return view
    }()
    
    private lazy var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // MARK: - UI Components
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    // MARK: - Set up
    private func setupUI() {
        // self.view 는 전체 view(부모)
        // 전체 view에 각각의 view를 추가
        // 추가한 순서대로 z 값이 정해짐 (나중에 넣은 black이 제일 위로 감)
        self.view.addSubview(self.redView)
        self.view.addSubview(self.blueView)
        self.view.addSubview(self.yellowView)
        self.view.addSubview(self.greenView)
        self.view.addSubview(self.blackView)
        // 각각 뷰에 오토레이아웃 함수 호출
        setRedViewLayout()
        setBlueViewLayout()
        setYellowViewLayout()
        setGreenViewLayout()
        setBlackViewLayout()
    }
    
    private func setRedViewLayout() {
        let redViewConstraint = [
            // self.view(전체 부모뷰)의 safe area의 top 위치에 동일하게 하겠다 + 10px 만큼 띄워놓겠다
            self.redView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.redView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10)
        ]
        NSLayoutConstraint.activate(redViewConstraint)
    }
    
    private func setBlueViewLayout() {
        let blueViewConstraint = [
            self.blueView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.blueView.leadingAnchor.constraint(equalTo: self.redView.trailingAnchor, constant: 10),
            self.blueView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            self.blueView.widthAnchor.constraint(equalTo: self.redView.widthAnchor)
        ]
        NSLayoutConstraint.activate(blueViewConstraint)
    }
    
    private func setYellowViewLayout() {
        let yellowViewConstraint = [
            // red의 밑에서 +10px가 yellow의 top
            // 전체 뷰에 red, yellow를 넣으면 우선 알아서 red, yellow가 반씩 나눠가짐
            self.yellowView.topAnchor.constraint(equalTo: self.redView.bottomAnchor, constant: 10),
            self.yellowView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            self.yellowView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            self.yellowView.heightAnchor.constraint(equalTo: self.redView.heightAnchor)
        ]
        NSLayoutConstraint.activate(yellowViewConstraint)
    }
    
    private func setGreenViewLayout() {
        let greenViewConstraint = [
            self.greenView.topAnchor.constraint(equalTo: self.blueView.bottomAnchor, constant: 10),
            self.greenView.leadingAnchor.constraint(equalTo: self.yellowView.trailingAnchor, constant: 10),
            self.greenView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            self.greenView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            self.greenView.widthAnchor.constraint(equalTo: self.redView.widthAnchor),
            self.greenView.heightAnchor.constraint(equalTo: self.blueView.heightAnchor)        ]
        NSLayoutConstraint.activate(greenViewConstraint)
    }
    
    private func setBlackViewLayout() {
        let blackViewConstraint = [
            self.blackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.blackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.blackView.heightAnchor.constraint(equalTo: self.redView.heightAnchor),
            self.blackView.widthAnchor.constraint(equalTo: self.redView.widthAnchor)
        ]
        NSLayoutConstraint.activate(blackViewConstraint)
    }
    
    // MARK: - Button Events
    
    // MARK: - Navigation
    
    // MARK: - Network Manager calls
    
    // MARK: - Extensions
    
}

@available(iOS 13.0.0, *)
struct WorkbookViewControllerPreview: PreviewProvider {
    static var previews: some View {
        WorkbookViewController().toPreview()
    }
}
 
