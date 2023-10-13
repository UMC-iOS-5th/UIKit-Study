//
//  CalcController.swift
//  MyCalculatorUsingMVVM
//
//  Created by Kyungsoo Lee on 2023/10/06.
//

import UIKit

class CalcController: UIViewController  {
    
    // MARK: - Variables
    let viewModel: CalcViewModel
    
    
    // MARK: - UI Components
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        
        /* <lazy var가 아닌 let으로 선언하면 생기는 오류>
         이 코드에서 calculatorCollectionView를 초기화할 때 dataSource와 delegate를 self로 설정하려고 했는데,
         이는 초기화 시점에 클래스의 인스턴스가 아직 생성되지 않았기 때문에 오류가 발생합니다.
         클래스 내부에서의 self는 인스턴스를 가리키기 때문에, 클래스의 인스턴스가 생성된 이후에야 비로소 self로 참조할 수 있습니다.
         이러한 상황에서는 lazy 속성을 사용하여 초기화를 늦추는 방법이 흔히 사용됩니다. 다음과 같이 코드를 수정해보세요 :)
         */
        
        /*
         forSupplementaryViewOfKind : 등록할 뷰의 종류를 지정
         */
        collectionView.register(CalcHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CalcHeaderCell.reuseIdentifier)
        collectionView.register(ButtonCell.self, forCellWithReuseIdentifier: ButtonCell.reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    
    // MARK: - Lifecycle
    init(_ viewModel: CalcViewModel = CalcViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemPurple
        self.setupUI()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.viewModel.updateViews = { [weak self] in
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
        }
    }
    
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.addSubview(self.collectionView)
        setCollectionViewLayout()
    }
    
    private func setCollectionViewLayout() {
        let collectionViewConstraint = [
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(collectionViewConstraint)
    }
}
// MARK: - CollectionView Methods
extension CalcController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Section Header Cell
    // 계산기 상단 결과창 섹션 cell의 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /*
     CalcHeaderCell을 반환하는 함수. -> 계산의 결과 값을 반환하는 뷰를 반환하는 함수
     
     dequeueReusableSupplementaryView(ofKind:withReuseIdentifier:for:) 메서드를 사용하여 kind 파라미터에 전달된 종류의 Supplementary View를 가져옴
     
     이 때 withReuseIdentifier는 해당 Supplementary View의 reuseIdentifier이며, for 파라미터는 Supplementary View의 위치를 나타냄
     
     as? CalcHeaderCell을 통해 가져온 Supplementary View가 CalcHeaderCell 클래스의 인스턴스인지 확인.
     
     만약 캐스팅에 실패하면(fatalError가 호출된다면) 앱이 중단하고 오류 메시지를 출력.
     
     캐스팅이 성공하면 CalcHeaderCell의 configure 메서드를 사용하여 CalcHeader의 Label의 내용을 설정.
     
     여기서 configure 메서드는 currentCalcText를 전달하여 현재까지 계산된 Text를 설정.
     
     최종적으로 설정된 CalcHeaderCell이 반환.
     
     이 함수는 주로 헤더나 푸터와 같은 부가적인 정보를 표시하기 위해 사용되며, CalcHeaderCell 클래스는 이러한 Supplementary View의 역할을 수행.
     */
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
    
    // 각 셀을 생성하고 구성하기 위해 호출
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // dequeueReusableCell()을 통해 재사용 가능한 셀을 얻는다. 셀이 없으면 fatalError를 반환.
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCell.reuseIdentifier, for: indexPath) as? ButtonCell else {
            fatalError("Failed to dequeue ButtonCell in CalcController.")
        }
        let calcButton = self.viewModel.calcButtonCells[indexPath.row]
        cell.configure(with: calcButton)
        
        // firstNumber와 operation까지는 입력이 완료됐고, secondNumber는 입력이 되지 않은 상태라면, operation Button의 색상을 반전시킨다.
        if let operation = self.viewModel.operation, self.viewModel.secondNumber == nil {
            if operation.title == calcButton.title {
                cell.setOperationSelected()
            }
        }
        
        return cell
    }
    
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    // CollectionView에 들어갈 Item에 size에 대한 정보
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let calcButton = self.viewModel.calcButtonCells[indexPath.row]
        switch calcButton {
            // calcButton이 .number 열거형일 때, 그 안에 있는 int가 (int == 0)을 만족한다면 -> 숫자이면서, 그 수가 0이면 case안으로 들어간다. [case let - where절 참고]
        case let .number(int) where int == 0:
            return CGSize(
                width: (view.frame.size.width/5)*2 + ((view.frame.size.width/5)/3),
                height: view.frame.size.width/5
            )
        default:
            return CGSize(
                width: view.frame.size.width/5,
                height: view.frame.size.width/5
            )
        }
    }
    
    // CollectionView에 들어갈 셀 사이의 수평 minimum spacing에 대한 정보
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return (self.view.frame.width/5)/3
    }
    
    // CollectionView에 들어갈 셀 사이의 수직 minimun spacingdp 대한 정보
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // 사용자가 셀을 터치할 때마다 해당 셀의 정보를 포함하는 'indexPath'를 통해 특정 동작을 수행 가능print(
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let buttonCell = self.viewModel.calcButtonCells[indexPath.row]
        self.viewModel.didSelectButton(with: buttonCell)
        /*
         비동기적으로 작업을 수행하기 위해 사용 (클로저를 앱의 메인 큐에서 비동기적으로 실행 가능.
         (여기서는 reloadData()를 메인 큐에서 비동기적으로 실행이 가능하다.)
         
         -> 이 코드는 removeFromSuperview()와 같이 사용되서는 안된다.
         why??
         
         아래 코드는 비동기적으로 메인 스레드에서 collectionView를 새로고침한다.
         removeFromSuperview()는 뷰 계층 구조에서 현재 뷰를 제거한다.
         
         만약 비동기적으로 두 작업을 동시에 실행한다면, reloadData()가 완료되기 전에 removeFromSuperview()를 통해서
         뷰가 제거된다면 문제가 발생할 수 있다.
         */
        //        DispatchQueue.main.async {
        //            self.collectionView.reloadData()
        //        }
    }
    
}

// UIKit으로 짠 화면을 SwiftUI로 바로 볼 수 있게 해주는 코드
import SwiftUI

@available(iOS 13.0.0, *)
struct CalcControllerPreview: PreviewProvider {
    static var previews: some View {
        CalcController().toPreview()
    }
}
