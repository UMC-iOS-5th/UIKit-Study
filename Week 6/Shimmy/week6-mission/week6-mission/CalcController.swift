//
//  ViewController.swift
//  week6-mission
//
//  Created by Seungbo Shim on 2023/11/07.
//

import UIKit

class CalcController: UIViewController {

    let viewModel: CalcControllerViewModel
    
    // MARK: - UI Components
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        
        // 등록할 뷰의 종류 지정
        collectionView.register(CalcHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CalcHeaderCell.reuseIdentifier)
        collectionView.register(ButtonCell.self, forCellWithReuseIdentifier: ButtonCell.identifier)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    // MARK: - Lifecycle
    init(viewModel: CalcControllerViewModel = CalcControllerViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemPurple
        self.setupUI()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.viewModel.updateViews = {
            [weak self] in
            DispatchQueue.main.async {
                [weak self] in
                self?.collectionView.reloadData()
            }
        }
    }

    // MARK: = UI Setup
    private func setupUI() {
        self.view.addSubview(self.collectionView)

        
        setCollectionViewLayout()
    }
    
    private func setCollectionViewLayout() {
        let collectionViewConstraint = [
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ]
        NSLayoutConstraint.activate(collectionViewConstraint)
    }
}

// MARK:  - CollectionView Methods
extension CalcController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Section Header Cell
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CalcHeaderCell.reuseIdentifier, for: indexPath) as? CalcHeaderCell else {
            fatalError("Failed to dequeue CalcHeaderCell in CalcController")
        }
        header.configure(currentCalcText: self.viewModel.calcHeaderLabel)
    
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        
        // Cell Spacing
        let totalCellHeight = view.frame.size.width
        let totalVerticalCellSpacing = CGFloat(10*4)
        
        // Screen height
        let window = view.window?.windowScene?.keyWindow
        let topPadding = window?.safeAreaInsets.top ?? 0
        let bottomPadding = window?.safeAreaInsets.bottom ?? 0
        
        // (상단, 하단의 safeArea를 포함하는 padding은 제외한)사용 가능한 뷰의 height
        let avaliableScreenHeight = view.frame.size.height - topPadding - bottomPadding
        
        // Calculate Header Height
        let headerHeight = (avaliableScreenHeight - totalCellHeight) - totalVerticalCellSpacing
        
        return CGSize(width: view.frame.size.width, height: headerHeight)
    }
    
    // MARK: - Normal Cells (Buttons)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.calcButtonCells.count
    }
    
    // 각 셀의 생성, 구성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCell.identifier, for: indexPath) as? ButtonCell else {
            fatalError("Failed to dequeue ButtonCell in CalcController.")
        }
        let calcButton = self.viewModel.calcButtonCells[indexPath.row]
        
        cell.configure(with: calcButton)
        
        // 연산자의 색상 변경?
        if let operation = self.viewModel.operation, self.viewModel.secondNumber == nil {
            if operation.title == calcButton.title {
                cell.setOperationSelected()
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let calcButton = self.viewModel.calcButtonCells[indexPath.row]
        
        // 0 버튼의 사이즈만 길게
        switch calcButton {
        case let .number(int) where int == 0:
            return CGSize(
                width: (view.frame.self.width/5)*2 + ((view.frame.self.width/5)/3),
                height: view.frame.size.width/5
            )
        default:
            return CGSize(width: view.frame.size.width/5, height: view.frame.size.width/5)
        }
    }
    
    // 버튼의 배치??
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return (self.view.frame.width/5)/4
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let buttonCell = self.viewModel.calcButtonCells[indexPath.row]
        self.viewModel.didSelectButton(with: buttonCell)
    }
}

