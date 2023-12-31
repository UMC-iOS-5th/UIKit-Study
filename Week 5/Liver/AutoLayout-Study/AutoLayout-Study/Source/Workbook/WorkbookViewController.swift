//
//  WorkbookViewController.swift
//  AutoLayout-Study
//
//  Created by Kyungsoo Lee on 10/19/23.
//

import UIKit
import SwiftUI

class WorkbookViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        
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
        self.view.addSubview(self.redView)
        self.view.addSubview(self.blueView)
        self.view.addSubview(self.yellowView)
        self.view.addSubview(self.greenView)
        self.view.addSubview(self.blackView)
        setRedViewLayout()
        setBlueViewLayout()
        setYellowViewLayout()
        setGreenViewLayout()
        setBlackViewLayout()
    }
    
    private func setRedViewLayout() {
        let redViewConstraint = [
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
