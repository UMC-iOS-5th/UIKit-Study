import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
//-----------------------------------------------------------------------------------------------------------------------

//UIView-----------------------------------------------------------------------------------------------------------------------
class UIViewTest: UIViewController {
    // MARK: - UIView
    private lazy var uiView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad() // 공부필요
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemBlue
        
        // 뷰 추가(아직 layout 설정 안된 상태)
        self.view.addSubview(uiView)// 공부필요
        
        setLayout()
    }

    // MARK: - UIView 제약조건
    private func setUIViewLayout() {
        
        let uiViewConstraint = 
        [
            uiView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            uiView.widthAnchor.constraint(equalToConstant: 200),
            uiView.heightAnchor.constraint(equalToConstant: 300)
        ]
        
        // NSLayoutConstraint 공부 필요
        
        // 제약 조건을 활성화 시켜 오토 레이아웃 설정한다.
        NSLayoutConstraint.activate(uiViewConstraint)
    }

    // MARK: - 전체 제약조건 설정
        // 컴포넌트들의 레이아웃을 설정한다
        private func setLayout() {
            // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.
            
            // UIView 제약조건 설정
            setUIViewLayout()
        }
}

//UILabel-----------------------------------------------------------------------------------------------------------------------

class UILabelTest: UIViewController {
    // MARK: - UILable
    private lazy var uiLable: UILabel = {
        let label = UILabel()
        label.text = "UILabel입니당~~~~~" // 내용
        label.textAlignment = .natural // 위치
        label.font = UIFont.boldSystemFont(ofSize: 30)// 폰트사이즈
        label.textColor = .red
        label.backgroundColor = .yellow
        
        label.translatesAutoresizingMaskIntoConstraints = false // 이건 뭐지?
        
        return label
    }()

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemCyan
        
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
    }
}
//UIButton-----------------------------------------------------------------------------------------------------------------------
class UIButtonTest: UIViewController {
    // MARK: - UIButton
    private lazy var uiButton: UIButton = {
        let button = UIButton()
        button.setTitle("UIButton이다!!!!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .red
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside) // 공부 필요
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.layer.masksToBounds = true
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowRadius = 5
        
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
        
        self.view.backgroundColor = .purple
        
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
      
        // UIButton 제약조건 설정
        setUIButtonLayout()
    }
}
//UITextField-----------------------------------------------------------------------------------------------------------------------
class UITextFieldTest: UIViewController, UITextFieldDelegate { //UITextFieldDelegate -> UITextField 객체의 동작과 관련된 메서드들을 정의한 프로토콜
    // MARK: - UITextField
    private lazy var uiTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "글자를 입력해라 얼른."
        textField.backgroundColor = .white
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
        
        // UITextField 제약조건 설정
        setUITextFieldLayout()
    }
}
//UITextView-----------------------------------------------------------------------------------------------------------------------
class UITextViewTest: UIViewController, UITextViewDelegate {// UITextViewDelegate -> UITextView 객체의 동작과 관련된 메서드들을 정의한 프로토콜
    //MARK: - UITextView
    private lazy var uiTextView: UITextView = { // lazy var?
       let textView = UITextView()
        textView.text = "UITextView입니다!!!!!!!"
        textView.textAlignment = .center
        textView.backgroundColor = .brown
        textView.textColor = .black
        textView.font = .systemFont(ofSize: 34, weight: .heavy)
        textView.layer.borderWidth = 5 // 경계공간
        textView.layer.borderColor = UIColor.red.cgColor
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
            uiTextView.widthAnchor.constraint(equalToConstant: 300), // 너비 제약 조건 추가
            uiTextView.heightAnchor.constraint(equalToConstant: 500) // 높이 제약 조건 추가
        ]
        NSLayoutConstraint.activate(uiTextViewConstraint)
    }


    // MARK: - 전체 제약조건 설정
    // 컴포넌트들의 레이아웃을 설정한다
    private func setLayout() {
        // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.
        
        // UITextView 제약조건 설정
        setUITextViewLayout()
    }
}
//UIImageView-----------------------------------------------------------------------------------------------------------------------
class UIImageViewTest: UIViewController {
    //MARK: - UIImageView
    private lazy var uiImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "INHA-UMC-5th")
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0.8// 흐림정도?
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
            uiImageView.widthAnchor.constraint(equalToConstant: 400), // 너비 제약 조건 추가
            uiImageView.heightAnchor.constraint(equalToConstant: 400) // 높이 제약 조건 추가
        ]
        NSLayoutConstraint.activate(uiImageViewConstraint)
    }


    // MARK: - 전체 제약조건 설정
    // 컴포넌트들의 레이아웃을 설정한다
    private func setLayout() {
        // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.
        
        // UIImageView 제약조건 설정
        setUIImageViewLayout()
    }
}
//UITableView-----------------------------------------------------------------------------------------------------------------------
class UITableViewTest: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //UITableViewDataSource -> 테이블 뷰의 데이터와 관련된 메서드들을 정의한 프로토콜
    //UITableViewDelegate -> 테이블 뷰의 동작과 인터페이스와 관련된 메서드들을 정의한 프로토콜
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
    private let data = ["항목 1", "항목 2", "항목 3", "항목 4", "항목 5","추가입니당","하나더","오예"]

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

//UICollectionViewTest-----------------------------------------------------------------------------------------------------------------------
class UICollectionViewTest: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // MARK: - UICollectionView
    private lazy var uiCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        // frame을 .zero로 사용하여 CGRect(0, 0, 0, 0)으로 초기화하고, 이후 오토 레이아웃을 통해 layout을 설정한다.
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        // UICollectionView가 속한 컨트롤러에 "UICollectionViewDataSource" 프로토콜을 추가해야 한다.
        // "UICollectionViewDataSource" 프로토콜을 따르기 위해선 collectionView()를 반드시 선언해야 한다.
        collectionView.dataSource = self
        // UICollectionView가 속한 컨트롤러에 "UICollectionViewDelegateFlowLayout" 프로토콜을 추가해야 한다.
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    
    // MARK: - UICollectionViewDataSource 메서드
    // 특정 섹션에 속하는 아이템(셀)의 총 개수를 반환한다.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    // 각 셀을 생성하고 구성하기 위해 호출
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // dequeueReusableCell()을 통해 재사용 가능한 셀을 얻는다. 셀이 없으면 재사용 큐에 셀을 생성한다.
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    // CollectionView에 들어갈 Item에 size에 대한 정보
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    // CollectionView에 들어갈 셀 사이의 minimum spacing에 대한 정보
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // CollectionView에 들어갈 각 Item의 Inset(여백) 대한 정보
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemGray
        
        // 뷰 추가(아직 layout 설정 안된 상태)
        self.view.addSubview(self.uiCollectionView)
        
        setLayout()
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
    
    // MARK: - 전체 제약조건 설정
    // 컴포넌트들의 레이아웃을 설정한다
    private func setLayout() {
        // 프레임 기반의 레이아웃을 비활성화 하여 오토 레이아웃을 기반으로 설정할 수 있도록 한다.
        
        // UICollectionView 제약조건 설정
        setUICollectionViewLayout()
    }
}


// UIKit으로 짠 화면을 SwiftUI로 바로 볼 수 있게 해주는 코드
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

//-----------------------------------------------------------------------------------------------------------------------
//@available(iOS 13.0.0, *) 구조체가 iOS 13.0 이상에서만 사용 가능 -> 왜냐? SwiftUI는 iOS 13.0에서 도입되었기 때문!
// : PreviewProvider
//PreviewProvider 프로토콜을 준수하는 구조체란 의미 - PreviewProvider 는 Xcode의 Canvas에서 SwiftUI 뷰의 미리보기를 제공하는데 사용!
@available(iOS 13.0.0, *)
struct UICollectionViewTestControllerPreView: PreviewProvider {
    static var previews: some View {
        UICollectionViewTest().toPreview()
    }
}
@available(iOS 13.0.0, *)
struct UITableViewTestControllerPreView: PreviewProvider {
    static var previews: some View {
        UITableViewTest().toPreview()
    }
}
@available(iOS 13.0.0, *)
struct UIImageViewTestControllerPreView: PreviewProvider {
    static var previews: some View {
        UIImageViewTest().toPreview()
    }
}
@available(iOS 13.0.0, *)
struct UITextViewTestPreView: PreviewProvider {
    static var previews: some View {
        UITextViewTest().toPreview()
    }
}
@available(iOS 13.0.0, *)
struct UITextFieldTestPreView: PreviewProvider {
    static var previews: some View {
        UITextFieldTest().toPreview()
    }
}
@available(iOS 13.0.0, *)
struct UIButtonTestPreView: PreviewProvider {
    static var previews: some View {
        UIButtonTest().toPreview()
    }
}
@available(iOS 13.0.0, *)
struct UILabelTestPreView: PreviewProvider {
    static var previews: some View {
        UILabelTest().toPreview()
    }
}
@available(iOS 13.0.0, *)
struct UIViewTestPreView: PreviewProvider {
    static var previews: some View {
        UIViewTest().toPreview()
    }
}
@available(iOS 13.0.0, *)
struct ViewControllerPreView: PreviewProvider {
    static var previews: some View {
        ViewController().toPreview()
    }
}
