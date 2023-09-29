# [2주차] 기본 컴포넌트

- UIKit에서 SwiftUI처럼 Preview를 사용하는 방법
    
    아래 코드를 Preview를 보고 싶은 ViewController에 붙여넣으면 됩니다~
    
    ```swift
    // UIKit으로 짠 화면을 SwiftUI로 바로 볼 수 있게 해주는 코드
    import SwiftUI
    
    struct ViewControllerResentable: UIViewControllerRepresentable {
        // typealias : 타입의 별칭을 정하는데 사용
        typealias UIViewControllerType = ViewController
        
        func makeUIViewController(context: Context) -> ViewController {
            return ViewController()
        }
        
        func updateUIViewController(_ uiViewController: ViewController, context: Context) {}
    }
    
    @available(iOS 13.0.0, *)
    struct ViewPreView: PreviewProvider {
        static var previews: some View {
            ViewControllerResentable()
        }
    }
    ```
    
- UIView
    
    ```swift
    
    ```
    
- UILabel
    
    
    ![Untitled](https://github.com/UMC-iOS-5th/UIKit-Study/assets/21362256/926ef804-15bb-4078-b79f-e4e29a691266)
  

  
    
    <UILabel>
    
    - 텍스트 레이블을 표시하는 데 사용
    
    [Method & Property]
    
    - **text**: 라벨에 표시할 문자열을 설정합니다.
    - **font**: 텍스트의 폰트를 설정합니다.
    - **textColor**: 텍스트의 색상을 설정합니다.
    - **textAlignment**: 텍스트의 정렬 방식을 설정합니다 (left, center, right 등).
    - **lineBreakMode**: 텍스트가 라벨의 크기를 초과할 때 줄 바꿈 방식을 설정합니다.
    - **numberOfLines**: 텍스트의 표시되는 줄 수를 설정합니다. 0으로 설정하면 자동으로 줄 바꿈됩니다.
    - **lineSpacing**: 텍스트 라인 간의 간격을 설정합니다 (NSAttributedString을 사용할 때).
    - **sizeToFit():** 텍스트의 길이에 따라 라벨의 너비와 높이가 자동으로 조절됩니다.
    
    등… 프로퍼티 및 메서드 추가로 공부해보기!
    
    ```swift
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
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemGray
        
        // 뷰 추가(아직 layout 설정 안된 상태)
        self.view.addSubview(uiLable)
        
        setLayout()
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
    
    // MARK: - 전체 제약조건 설정
    // 컴포넌트들의 레이아웃을 설정한다
    private func setLayout() {
        // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.
        
        // UILabel 제약조건 설정
        setUILableLayout()
        
        // UIButton 제약조건 설정
        //        setUIButtonLayout()
        
        // UITextField 제약조건 설정
        //        setUITextFieldLayout()
        
        // UITextView 제약조건 설정
        //        setUITextViewLayout()
        
        // UIImageView 제약조건 설정
        //        setUIImageViewLayout()
        
        // UITableView 제약조건 설정
    	  //				setUITableViewLayout()
    }
    ```
    
- UIButton
    
    

    ![Untitled 1](https://github.com/UMC-iOS-5th/UIKit-Study/assets/21362256/ab9d8479-589e-49ca-8ee7-c45d6a1f290e)
    
    <UIButton>
    
    - 버튼을 생성하고 사용자 상호 작용을 처리하는 데 사용
    - 터치 이벤트 또는 제스처 인식을 통해 동작을 수행 (추가적인 이벤트 또는 제스처 함수를 구현해야 함)
    
    [Method & Property]
    
    - **backgroundColor:** 배경 색을 지정한다.
    - **setTitle():** 버튼에 넣을 텍스트를 지정한다.
    - ******************************setTitleColor():****************************** 버튼의 텍스트 색상을 지정한다.
    - **addTarget():** 버튼의 이벤트에 대한 액션을 추가한다.
    
    등… 프로퍼티 및 메서드 추가로 공부해보기!
    
    ```swift
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
    
    // MARK: - UIBUtton이 눌렸을 때 호출되는 액션 함수
    @objc func buttonTapped() {
        print("버튼이 눌렸습니다.")
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemGray
        
        // 뷰 추가(아직 layout 설정 안된 상태)
        self.view.addSubview(uiButton)
        
        setLayout()
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
    
    // MARK: - 전체 제약조건 설정
    // 컴포넌트들의 레이아웃을 설정한다
    private func setLayout() {
        // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.
        
        // UILabel 제약조건 설정
        //        setUILableLayout()
        
        // UIButton 제약조건 설정
        setUIButtonLayout()
        
        // UITextField 제약조건 설정
        //        setUITextFieldLayout()
        
        // UITextView 제약조건 설정
        //        setUITextViewLayout()
        
        // UIImageView 제약조건 설정
        //        setUIImageViewLayout()
        
        // UITableView 제약조건 설정
    	  //				setUITableViewLayout()
    }
    ```
    
- UITextField
    
    
    ![Untitled 2](https://github.com/UMC-iOS-5th/UIKit-Study/assets/21362256/b7a15c83-6349-43d0-a2e1-1a1461498eda)

    
    <UITextField>
    
    - 단일 행의 텍스트 입력을 허용하는 뷰
    - 텍스드 필드에서 키보드 입력을 받고 텍스트를 편집
    
    [Method & Property]
    
    - **placeholder:** 아무것도 적혀있지 않을 때 보여줄 텍스트를 지정한다.
    - **delegate:** 사용자와 상호 작용하고 입력 이벤트를 처리하기 위해 딜리게이트를 지정한다. 이 때, UITextField가 속한 Controller에 “UITextFieldDelegate” 프로토콜을 추가해야 한다.
    
    등… 프로퍼티 및 메서드 추가로 공부해보기!
    
    ```swift
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
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemGray
        
        // 뷰 추가(아직 layout 설정 안된 상태)
        self.view.addSubview(uiTextField)
        
        setLayout()
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
    
    // MARK: - 전체 제약조건 설정
    // 컴포넌트들의 레이아웃을 설정한다
    private func setLayout() {
        // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.
        
        // UILabel 제약조건 설정
        //        setUILableLayout()
        
        // UIButton 제약조건 설정
        //        setUIButtonLayout()
        
        // UITextField 제약조건 설정
        setUITextFieldLayout()
        
        // UITextView 제약조건 설정
        //        setUITextViewLayout()
        
        // UIImageView 제약조건 설정
        //        setUIImageViewLayout()
        
        // UITableView 제약조건 설정
    	  //				setUITableViewLayout()
    }
    ```
    
- UITextView
    
    
    ![Untitled 3](https://github.com/UMC-iOS-5th/UIKit-Study/assets/21362256/b065e593-dc41-4fc2-92db-246973dfc238)

    
    <UITextView>
    
    - 다중 행의 텍스트 입력을 허용하는 뷰
    - 긴 텍스트 블록을 입력하고 편집하는 데 사용
    - UITextField와는 다르게 너비와 높이 제약 조건을 설정해야 한다.
    
    [Method & Property]
    
    - **text:** UITextView에 초기 텍스트를 지정한다.
    - ******************************font:****************************** 텍스트의 폰트를 지정한다.
    - **layer:** UITextView의 뷰 레이어를 지정한다. (border 등을 지정할 수 있다.
    - **********isEditable:********** UITextView 안의 텍스트의 변경 허용 여부를 결정한다.
    - **delegate:** 사용자와 상호 작용하고 입력 이벤트를 처리하기 위해 딜리게이트를 지정한다. 이 때, UITextView가 속한 Controller에 “UITextViewDelegate” 프로토콜을 추가해야 한다.
    
    등… 프로퍼티 및 메서드 추가로 공부해보기!
    
    ```swift
    //MARK: - UITextView
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
        textView.delegate = self
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemGray
        
        // 뷰 추가(아직 layout 설정 안된 상태)
        self.view.addSubview(uiTextView)
        
        setLayout()
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
    
    // MARK: - 전체 제약조건 설정
    // 컴포넌트들의 레이아웃을 설정한다
    private func setLayout() {
        // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.
        
        // UILabel 제약조건 설정
        //        setUILableLayout()
        
        // UIButton 제약조건 설정
        //        setUIButtonLayout()
        
        // UITextField 제약조건 설정
        //        setUITextFieldLayout()
        
        // UITextView 제약조건 설정
        setUITextViewLayout()
        
        // UIImageView 제약조건 설정
        //        setUIImageViewLayout()
        
        // UITableView 제약조건 설정
    	  //				setUITableViewLayout()
    }
    ```
    
- UIImageView
    
    
    ![Untitled 4](https://github.com/UMC-iOS-5th/UIKit-Study/assets/21362256/27d1e45b-3b34-4ede-b0a1-b23fb1005248)

    
    <실습용 사진>
    
    ![INHA-UMC-5th](https://github.com/UMC-iOS-5th/UIKit-Study/assets/21362256/1c551d4a-501f-40d1-ad41-5aab4042e3c8)

    
    <UIImageView>
    
    - 이미지를 표시하는데 사용
    - 로컬 이미지 또는 원격 이미지를 표시하는 데 사용
    
    [Method & Property]
    
    - **image:** 이미지 뷰에 표시되는 이미지를 설정하거나 가져온다.
    - **contentMode:** 이미지의 표시 방식을 설정한다. (뷰 내에서 자동으로 어떻게 조정되는지에 대한 설정)
    - **alpha**: 이미지 뷰의 투명도를 설정한다.
    
    등… 프로퍼티 및 메서드 추가로 공부해보기!
    
    ```swift
    //MARK: - UIImageView
    private lazy var uiImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "INHA-UMC-5th")
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0.5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemGray
        
        // 뷰 추가(아직 layout 설정 안된 상태)
        self.view.addSubview(uiImageView)
        
        setLayout()
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
    
    // MARK: - 전체 제약조건 설정
    // 컴포넌트들의 레이아웃을 설정한다
    private func setLayout() {
        // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.
        
        // UILabel 제약조건 설정
        //        setUILableLayout()
        
        // UIButton 제약조건 설정
        //        setUIButtonLayout()
        
        // UITextField 제약조건 설정
        //        setUITextFieldLayout()
        
        // UITextView 제약조건 설정
        //        setUITextViewLayout()
        
        // UIImageView 제약조건 설정
        setUIImageViewLayout()
        
        // UITableView 제약조건 설정
    	  //				setUITableViewLayout()
    }
    ```
    
- UITableView
    
    
    ![Untitled 5](https://github.com/UMC-iOS-5th/UIKit-Study/assets/21362256/efaa7eb4-644f-4a2a-a1e7-9d18bad70bd6)

    
    <UITableView>
    
    - 테이블 뷰를 생성하고 표시하는데 사용
    - 리스트나 표 형태의 데이터를 표시하고 편집하는 데 사용
    
    [Method & Property]
    
    - **register():** UITableView에서 사용할 셀 클래스를 등록하는 역할. 어떤 종류의 셀을 표시할 것인지 알려주는 역할
    - **dataSource:** 데이터 소스를 테이블 뷰에 할당하여 테이블 뷰가 데이터를 어디서 가져와서 어떻게 표시할 지를 알려주기 위해 설정 (UITableView가 속한 컨트롤러에 "UITableViewDataSource" 프로토콜을 추가해야 한다. 해당 프로토콜을 따르기 위해서는 tableView()라는 메서드가 필요하다.)
    - **delegate**: 테이블 뷰의 동작 및 사용자 상호 작용(셀 선택, 스크롤 등…)을 제어하기 위해 사용. 
    (UITableView가 속한 컨트롤러에 "UITableViewDelegate" 프로토콜을 추가해야 한다.)
    
    등… 프로퍼티 및 메서드 추가로 공부해보기!
    
    ```swift
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
        let UITableViewConstraint = [
            // 다른 컴포넌트의 상대적인 위치로 제약조건을 설정할 수도 있다.
            uiTableView.topAnchor.constraint(equalTo: view.topAnchor),
            uiTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            uiTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            uiTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(UITableViewConstraint)
        
    }
    
    // MARK: - 전체 제약조건 설정
    // 컴포넌트들의 레이아웃을 설정한다
    private func setLayout() {
        // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.
        
        // UILabel 제약조건 설정
        //        setUILableLayout()
        
        // UIButton 제약조건 설정
        //        setUIButtonLayout()
        
        // UITextField 제약조건 설정
        //        setUITextFieldLayout()
        
        // UITextView 제약조건 설정
        //        setUITextViewLayout()
        
        // UIImageView 제약조건 설정
        //        setUIImageViewLayout()
        
        // UITableView 제약조건 설정
    	  setUITableViewLayout()
    }
    ```
    
    

### <실습 인증>

- UIKit에서 SwiftUI처럼 Preview를 사용하는 방법
  <img width="1728" alt="Screenshot 2023-09-30 at 3 28 05 AM" src="https://github.com/UMC-iOS-5th/UIKit-Study/assets/21362256/1d382a7c-678a-4f4b-b2c0-97c6f4b7fdf0">

- UIView
  

- UILabel
  <img width="1728" alt="Screenshot 2023-09-30 at 3 28 54 AM" src="https://github.com/UMC-iOS-5th/UIKit-Study/assets/21362256/ce83d4ad-8ad7-4c5f-8092-fc06f6fef54a">

- UIButton
  <img width="1728" alt="Screenshot 2023-09-30 at 3 29 12 AM" src="https://github.com/UMC-iOS-5th/UIKit-Study/assets/21362256/00d8f49b-0496-4f49-a205-fa5dbd82ff3a">

- UITextField
  <img width="1728" alt="Screenshot 2023-09-30 at 3 29 26 AM" src="https://github.com/UMC-iOS-5th/UIKit-Study/assets/21362256/018ced35-bb6c-47cd-90d3-d67b44f89951">

- UITextView
  <img width="1728" alt="Screenshot 2023-09-30 at 3 29 37 AM" src="https://github.com/UMC-iOS-5th/UIKit-Study/assets/21362256/3f46e8af-4420-4287-87e1-2aba5d033278">
  
- UIImageView
  <img width="1728" alt="Screenshot 2023-09-30 at 3 29 46 AM" src="https://github.com/UMC-iOS-5th/UIKit-Study/assets/21362256/c77f6309-2eee-4878-a7de-1473347f1c21">

  
- UITableView
  <img width="1728" alt="Screenshot 2023-09-30 at 3 29 57 AM" src="https://github.com/UMC-iOS-5th/UIKit-Study/assets/21362256/685ec981-0163-4441-ae13-0221c2176d38">

  
