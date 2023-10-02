//
//  ViewController.swift
//  UIKit-Practice
//
//  Created by Kyungsoo Lee on 2023/09/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    /*
     lazy를 사용하여 초기화 시점 조절 가능(지연 초기화)
     lazy를 사용하면 변수의 초기화 시점을 viewController가 초기화 된 이후로 늦출 수 있다.
     그럼 왜 초기화를 늦춰야 할까?
     -> #selector부분에서 self를 사용할 때 초기화를 늦춰야만 ViewController에 접근이 가능하다.
     (또한, lazy를 사용할 때는 반드시 var를 사용해야한다.)
     */
    
    // MARK: - UIView
    private lazy var uiView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // MARK: - UILable
    private lazy var uiLable: UILabel = {
        let label = UILabel()
        label.text = "UILabel"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = .white
        label.backgroundColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - UIButton
    private lazy var uiButton: UIButton = {
        let button = UIButton()
        button.setTitle("UIButton", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray2
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // MARK: - UIButton이 눌렸을 때 호출되는 액션 함수
    @objc func buttonTapped() {
        print("버튼이 눌렸습니다.")
    }
    
    // MARK: - UITextField
    private lazy var uiTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "글자를 입력하세요."
        textField.backgroundColor = .lightGray
        textField.textColor = .black
        // UITextField가 속한 컨트롤러에 "UITextFieldDelegate" 프로토콜을 추가해야 한다.
        // 사용자와 상호 작용하고 입력 이벤트를 처리하기 위해 프로토콜을 추가
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    // MARK: - UITextView
    private lazy var uiTextView: UITextView = {
        let textView = UITextView()
        textView.text = "UITextView"
        textView.textAlignment = .center
        textView.backgroundColor = .black
        textView.textColor = .white
        textView.font = .systemFont(ofSize: 24, weight: .medium)
        textView.layer.borderWidth = 5
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.isEditable = true
        // UITextView가 속한 컨트롤러에 "UITextViewDelegate" 프로토콜을 추가해야 한다.
        // 사용자와 상호 작용하고 입력 이벤트를 처리하기 위해 프로토콜을 추가
        textView.delegate = self
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    // MARK: - UIImageView
    private lazy var uiImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "INHA-UMC-5th")
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0.5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
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
    private let data = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    
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
    
    // MARK: - UICollectionView
    private lazy var uiCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        // frame을 .zero로 사용하여 CGRect(0, 0, 0, 0)으로 초기화하고, 이후 오토 레이아웃을 통해 layout을 설정한다.
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .white
        // UICollectionView가 속한 컨트롤러에 "UICollectionViewDataSource" 프로토콜을 추가해야 한다.
        // "UICollectionViewDataSource" 프로토콜을 따르기 위해선 collectionView()를 반드시 선언해야 한다.
        collectionView.dataSource = self
        // UICollectionView가 속한 컨트롤러에 "UICollectionViewDelegateFlowLayout" 프로토콜을 추가해야 한다.
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    
    // MARK: - UICollectionViewDataSource 메서드
    // 특정 섹션에 속하는 아이템(셀)의 총 개수를 반환한다.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    // 각 셀을 생성하고 구성하기 위해 호출
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // dequeueReusableCell()을 통해 재사용 가능한 셀을 얻는다. 셀이 없으면 재사용 큐에 셀을 생성한다.
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    // CollectionView에 들어갈 Item에 size에 대한 정보
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
    
    // CollectionView에 들어갈 셀 사이의 minimum spacing에 대한 정보
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // CollectionView에 들어갈 각 Item의 Inset(여백) 대한 정보
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    // MARK: - UISegmentedControl
    private lazy var uiSegmentedControl: UISegmentedControl = {
        let items = ["Item 1", "Item 2", "Item 3"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    // MARK: - UISegmentedControl이 눌렸을 때 호출되는 액션 함수
    @objc func segmentedControlValueChanged() {
        let selectedSegmentIndex = uiSegmentedControl.selectedSegmentIndex
        print("Selected Segment Index: \(selectedSegmentIndex)")
    }
    
    // MARK: - UISlider
    private lazy var uiSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        return slider
    }()
    
    // MARK: - UISlider 값을 변경할 때 호출되는 액션 함수
    @objc func sliderValueChanged(_ sender: UISlider) {
        let sliderValue = sender.value
        print("Slider Value: \(sliderValue)")
    }
    
    // MARK: - UITabBarController
    // FirstTabView
    private lazy var firstViewController: UIViewController = {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .lightGray
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        return viewController
    }()

    
    // SecondTabView
    private lazy var secondViewController: UIViewController = {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .gray
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return viewController
    }()
    
    // ThirdTabView
    private lazy var thirdViewController: UIViewController = {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .darkGray
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        
        return viewController
    }()
    
    // TabBarConroller
    private lazy var customTabBarController: UITabBarController = {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [firstViewController, secondViewController, thirdViewController]
        tabBarController.view.translatesAutoresizingMaskIntoConstraints = false
        
        return tabBarController
    }()
    
    // MARK: - StackView
    // FirstView
    private lazy var firstView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    // SecondView
    private lazy var secondView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    // ThirdView
    private lazy var thirdView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    private lazy var uiStackView: UIStackView = {
        let stackView = UIStackView()
        // StackView에 뷰들을 추가
        stackView.addArrangedSubview(firstView)
        stackView.addArrangedSubview(secondView)
        stackView.addArrangedSubview(thirdView)
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - UINavigationController
    private lazy var uiNavigationController: UINavigationController = {
        // RootView
        let rootViewController = UIViewController()
        rootViewController.view.backgroundColor = .white
        rootViewController.title = "Root View"
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.view.translatesAutoresizingMaskIntoConstraints = false
        
        return navigationController
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func nextButtonTapped() {
        let destinationViewController = NextViewController()
        navigationController?.pushViewController(destinationViewController, animated: true)
    }
    
    // MARK: - ScrollView
    // FirstView
    private lazy var scrollElementFirstView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    // SecondView
    private lazy var scrollElementSecondView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    // ThirdView
    private lazy var scrollElementThirdView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // FourthView
    private lazy var scrollElementFourthView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var scrollElementUiStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        // StackView에 뷰들을 추가
        stackView.addArrangedSubview(scrollElementFirstView)
        stackView.addArrangedSubview(scrollElementSecondView)
        stackView.addArrangedSubview(scrollElementThirdView)
        stackView.addArrangedSubview(scrollElementFourthView)
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var uiScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.addSubview(scrollElementUiStackView)
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemGray
        
        // 뷰 추가(아직 layout 설정 안된 상태)
//        self.view.addSubview(uiView)
//                self.view.addSubview(uiLable)
//                self.view.addSubview(uiButton)
//                self.view.addSubview(uiTextField)
//                self.view.addSubview(self.uiTextView)
//                self.view.addSubview(self.uiImageView)
//        self.view.addSubview(self.uiTableView)
//        self.view.addSubview(self.uiCollectionView)
//        self.view.addSubview(self.uiSegmentedControl)
//        self.view.addSubview(self.uiSlider)
        
        // 현재의 ViewController에 tabBarController를 추가하는 부분
        // 현재 뷰의 자식으로 customTabBarController를 등록한다.
//        addChild(customTabBarController)
//        view.addSubview(customTabBarController.view)
//        customTabBarController.didMove(toParent: self)

//        self.view.addSubview(uiStackView)
        
        // NavigationController 추가
//        self.view.addSubview(uiNavigationController.view)
//        // 네비게이션 컨트롤러에 루트 뷰 컨트롤러를 추가
//        addChild(uiNavigationController)
//        uiNavigationController.didMove(toParent: self)
//        
//        view.addSubview(nextButton)
        self.view.addSubview(uiScrollView)
        
        setLayout()
    }
    
    // MARK: - UIView 제약조건
    private func setUIViewLayout() {
        let uiViewConstraint = [
            uiView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            uiView.widthAnchor.constraint(equalToConstant: 100),
            uiView.heightAnchor.constraint(equalToConstant: 100)
        ]
        // 제약 조건을 활성화 시켜 오토 레이아웃 설정한다.
        NSLayoutConstraint.activate(uiViewConstraint)
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
    
    // MARK: - UIButton 제약조건
    private func setUIButtonLayout() {
        let uiButtonConstraint = [
            // 다른 컴포넌트의 상대적인 위치로 제약조건을 설정할 수도 있다.
            uiButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        NSLayoutConstraint.activate(uiButtonConstraint)
    }
    
    // MARK: - UITextField 제약조건
    private func setUITextFieldLayout() {
        let uiTextFieldConstraint = [
            // 다른 컴포넌트의 상대적인 위치로 제약조건을 설정할 수도 있다.
            uiTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        NSLayoutConstraint.activate(uiTextFieldConstraint)
    }
    
    // MARK: - UITextView 제약 조건
    private func setUITextViewLayout() {
        let uiTextViewConstraint = [
            // 다른 컴포넌트의 상대적인 위치로 제약조건을 설정할 수도 있다.
            uiTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            uiTextView.widthAnchor.constraint(equalToConstant: 200), // 너비 제약 조건 추가
            uiTextView.heightAnchor.constraint(equalToConstant: 200) // 높이 제약 조건 추가
        ]
        NSLayoutConstraint.activate(uiTextViewConstraint)
    }
    
    // MARK: - UIImageView 제약 조건
    private func setUIImageViewLayout() {
        let uiImageViewConstraint = [
            // 다른 컴포넌트의 상대적인 위치로 제약조건을 설정할 수도 있다.
            uiImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            uiImageView.widthAnchor.constraint(equalToConstant: 200), // 너비 제약 조건 추가
            uiImageView.heightAnchor.constraint(equalToConstant: 200) // 높이 제약 조건 추가
        ]
        NSLayoutConstraint.activate(uiImageViewConstraint)
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
    
    // MARK: - UICollectionView 제약 조건
    private func setUICollectionViewLayout() {
        let uiCollectionViewConstraint = [
            uiCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            uiCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            uiCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
        ]
        NSLayoutConstraint.activate(uiCollectionViewConstraint)
        
    }
    
    // MARK: - UISegmentedControl 제약 조건
    private func setUISegmentedControlLayout() {
        let uiSegmentedControlConstraint = [
            uiSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiSegmentedControl.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        NSLayoutConstraint.activate(uiSegmentedControlConstraint)
    }
    
    // MARK: - UISlider 제약 조건
    private func setUISliderLayout() {
        let uiSliderConstraint = [
            uiSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiSlider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            uiSlider.widthAnchor.constraint(equalToConstant: 200)
        ]
        NSLayoutConstraint.activate(uiSliderConstraint)
        
    }
    
    // MARK: - CustomTabBarControllerLayout 제약 조건
    private func setTabBarControllerLayout() {
        // tabBarController의 레이아웃을 설정하는 코드를 여기에 추가해
        // 예를 들어, 아래는 tabBarController를 현재 뷰 컨트롤러의 view에 꽉 차게 설정하는 코드야
        let tabBarControllerConstraint = [
            customTabBarController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customTabBarController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            customTabBarController.view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            customTabBarController.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ]
        
        NSLayoutConstraint.activate(tabBarControllerConstraint)
    }
    
    // MARK: - UIStackViewLayout 제약 조건
    private func setUIStackViewLayout() {
        // tabBarController를 현재 뷰 컨트롤러의 view에 꽉 차게 설정
        let tabBarControllerConstraint = [
            uiStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            uiStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            uiStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            uiStackView.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(tabBarControllerConstraint)
    }
    
    // MARK: - UINavigaionControllerLayout 제약 조건
    private func setUINavigaionControllerLayout() {
        let uiNavigationControllerConstraint = [
            uiNavigationController.view.topAnchor.constraint(equalTo: view.topAnchor),
            uiNavigationController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            uiNavigationController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            uiNavigationController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(uiNavigationControllerConstraint)
    }
    
    // MARK: - NextButtonLayout 제약 조건
    private func setNextButtonLayout() {
        let nextButtonConstraint = [
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(nextButtonConstraint)
    }
    
    // MARK: - UIScrollViewLayout 제약 조건
    private func setScrollElementViewsLayout() {
        let elementViewsConstraint = [
            scrollElementFirstView.widthAnchor.constraint(equalTo: uiScrollView.widthAnchor),
            scrollElementFirstView.heightAnchor.constraint(equalToConstant: 200),
            scrollElementSecondView.widthAnchor.constraint(equalTo: uiScrollView.widthAnchor),
            scrollElementSecondView.heightAnchor.constraint(equalToConstant: 200),
            scrollElementThirdView.widthAnchor.constraint(equalTo: uiScrollView.widthAnchor),
            scrollElementThirdView.heightAnchor.constraint(equalToConstant: 200),
            scrollElementFourthView.widthAnchor.constraint(equalTo: uiScrollView.widthAnchor),
            scrollElementFourthView.heightAnchor.constraint(equalToConstant: 200)
            ]
        NSLayoutConstraint.activate(elementViewsConstraint)
    }

    // UIStackViewLayout 제약 조건
    private func setUIScrollElementStackViewLayout() {
        let stackViewConstraint = [
            scrollElementUiStackView.leadingAnchor.constraint(equalTo: uiScrollView.contentLayoutGuide.leadingAnchor),
            scrollElementUiStackView.trailingAnchor.constraint(equalTo: uiScrollView.contentLayoutGuide.trailingAnchor),
            scrollElementUiStackView.topAnchor.constraint(equalTo: uiScrollView.contentLayoutGuide.topAnchor),
            scrollElementUiStackView.bottomAnchor.constraint(equalTo: uiScrollView.contentLayoutGuide.bottomAnchor)
            ]
        
        NSLayoutConstraint.activate(stackViewConstraint)
    }
    
    // UIScrollViewLayout 제약조건
    private func setUIScrollViewLayout() {
        let scrollViewConstraint = [
            uiScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            uiScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // safeLayoutGuide로 잡으면 safelayout 바깥 쪽은 스크롤 X
            uiScrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            uiScrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
            ]
        
        NSLayoutConstraint.activate(scrollViewConstraint)
    }
    
    // MARK: - 전체 제약조건 설정
    // 컴포넌트들의 레이아웃을 설정한다
    private func setLayout() {
        // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.
        
        // UIView 제약조건 설정
//        setUIViewLayout()
        
        // UILabel 제약조건 설정
//                setUILableLayout()
        
        // UIButton 제약조건 설정
//                setUIButtonLayout()
        
        // UITextField 제약조건 설정
//                setUITextFieldLayout()
        
        // UITextView 제약조건 설정
//                setUITextViewLayout()
        
        // UIImageView 제약조건 설정
//                setUIImageViewLayout()
        
        // UITableView 제약조건 설정
//        setUITableViewLayout()
        
        // UICollectionView 제약조건 설정
//        setUICollectionViewLayout()
        
        // UISegmentedControl 제약조건 설정
//        setUISegmentedControlLayout()
        
        // UISlider 제약조건 설정
//        setUISliderLayout()
        
        // TabBarController 제약조건 설정
//        setTabBarControllerLayout()
        
        // UIStackView 제약조건 설정
//        setUIStackViewLayout()
        
        // UINavigationController 제약조건 설정
//        setUINavigaionControllerLayout()
        // setNexxtButton 제약조건 설정(UINavigationController)
//        setNextButtonLayout()
        
        // UIScrollView 제약조건 설정
        setScrollElementViewsLayout()
        setUIScrollElementStackViewLayout()
        setUIScrollViewLayout()
    }
}

// UINavigationController에 사용되는 NextViewController
class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        title = "Next View"
    }
}

// UIKit으로 짠 화면을 SwiftUI로 바로 볼 수 있게 해주는 코드
import SwiftUI

@available(iOS 13.0.0, *)
struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ViewController().toPreview()
    }
}
