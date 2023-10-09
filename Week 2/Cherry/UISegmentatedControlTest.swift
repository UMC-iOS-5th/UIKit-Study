//
//  UISegmentatedControlTest.swift
//  w3
//
//  Created by 이희주 on 2023/10/09.
//

//다중 선택 관련 control

import Foundation
import SwiftUI
import UIKit

class UISegmentedControlTest: UIViewController{
    private lazy var uISegmentedControl : UISegmentedControl = {
        let items = ["1", "2", "3"]
        let segmentedControl = UISegmentedControl(items : items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        return segmentedControl
    } ()
    
    //uISegmentedControl 생성할 때 함께 호출(addTarget() 함수에서)
    //#action
    @objc func segmentedControlValueChanged() {
        let selectedSegmentIndex = uISegmentedControl.selectedSegmentIndex
        //출력은 어디에?
        print("selected segment index: \(selectedSegmentIndex)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //scope of self?
        self.view.backgroundColor = .systemGray
        self.view.addSubview(self.uISegmentedControl)
        
        setLayout()
    }
    
    private func setUISegmentedControlLayout(){
        let uISegmentedControlConstraint = [
            uISegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uISegmentedControl.centerYAnchor.constraint(equalTo: view.centerYAnchor)]
        
        NSLayoutConstraint.activate(uISegmentedControlConstraint)
    }
    
    private func setLayout(){
        setUISegmentedControlLayout()
    }
}

@available(iOS 13.0.0, *)
struct UISegmentControlTestPreView: PreviewProvider {
    static var previews: some View {
        UISegmentedControlTest().toPreview()
    }
}
