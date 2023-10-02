//
//  UITableViewTest.swift
//  UIKit-Study
//
//  Created by Seungbo Shim on 2023/10/03.
//


import UIKit

class UITableViewTest: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // MARK: - UITableView
    private lazy var uiTableView: UITableView = {
        let tableView = UITableView()
        // UITableView의 설정
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // UITableView가 속한 컨트롤러에 "UITableViewDataSource" 프로토콜을 추가해야 한다.
        // "UITableViewDataSource" 프로토콜을 따르기 위해선 tableView()을 반드시 선언해야 한다.
        tableView.dataSource = self
        // UITableView가 속한 컨트롤러에 "UITableViewDelegate" 프로토콜을 추가해야 한다.
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()

    // MARK: - UITableViewDataSource 메서드
        
    // 테이블 뷰에 표시할 데이터 배열
    private let data = ["항목 1", "항목 2", "항목 3", "항목 4", "항목 5"]

    // 섹션당 행의 개수를 반환하는 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    // 각 행의 셀을 구성하는 메서드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }

    // (Option) 특정 행을 선택했을 때 실행되는 메서드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = data[indexPath.row]
        print("선택된 항목: \(selectedItem)")
    }

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemGray
        
        // 뷰 추가(아직 layout 설정 안된 상태)
        self.view.addSubview(uiTableView)
        
        setLayout()
    }

    // MARK: - UITableView 제약 조건
    private func setUITableViewLayout() {
        let uiTableViewConstraint = [
            // 다른 컴포넌트의 상대적인 위치로 제약조건을 설정할 수도 있다.
            uiTableView.topAnchor.constraint(equalTo: view.topAnchor),
            uiTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            uiTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            uiTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(uiTableViewConstraint)
        
    }

    // MARK: - 전체 제약조건 설정
    // 컴포넌트들의 레이아웃을 설정한다
    private func setLayout() {
        // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.

        // UITableView 제약조건 설정
          setUITableViewLayout()
    }
}

// UIKit으로 짠 화면을 SwiftUI로 바로 볼 수 있게 해주는 코드
import SwiftUI

@available(iOS 13.0.0, *)
struct UITableViewTestControllerPreView: PreviewProvider {
    static var previews: some View {
        UITableViewTest().toPreview()
    }
}
