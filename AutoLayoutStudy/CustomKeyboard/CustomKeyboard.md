# Custom Keyboard (.xib)

<br>

- 나만의 키보드 만들기!

- xib 파일로 만들기

<br>

---

## Custom Keyboard View를 만들기

<br>

새로운 파일 생성 > CustomKeyboard (UIView)

ViewController가 아니면 xib 파일에서 작업하는 경우가 많다. Storyboard에는 controller만 바로 넣을 수 있기 때문!

→ View 파일 추가(.xib)

<img width="500" alt="xib" src="https://user-images.githubusercontent.com/63290629/220232575-1fd9c0dc-ac0d-4c3b-aa27-9eade14c19a8.png">


> 💡 *View의 Size > Freeform 필수*


바둑판과 같이 정렬된 형태를 보여줄 때 사용 → StackView  
코드 연결하기 → CustomKeyboard.swift

<br>

**Custom Keyboard 불러오기**  

- 화면을 구성하는 ```xib``` 파일을 기준으로 코드와 연결된 상태로 불러오기

- ```xib``` 파일에서 View를 불러오기

- **첫번째 View(오브젝트)가져오기** → 여러 오브젝트가 배열에 들어가서 구성할 수 있으므로 우리가 원하는건 첫번째 view

<br>

```swift
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var customTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //custom keyboard view 설정
        let loadNib = Bundle.main.loadNibNamed("CustomKeyboard", owner: nil)
        let myKeyboardView = loadNib?.first as! CustomKeyboard
        //custom keyboard view를 만들면 아래의 한줄로 연결할 수 있다
        customTextField.inputView = myKeyboardView
    }
}
```

<p align= center>
    <img src=https://user-images.githubusercontent.com/63290629/220232919-70b16d55-b805-4288-a871-75a24625d621.png width="40%"/> 
    &nbsp;&nbsp;&nbsp;&nbsp; 
    <img src=https://user-images.githubusercontent.com/63290629/220232955-b6063a7d-b0b7-4939-9fce-0437af0745a1.png width="40%"/>
</p>

보안키보드는 중간 중간에 불규칙적으로 빈공간을 만든다

> **StackView의 장점**  
안에 오브젝트를 넣으면 간격, 사이즈 등을 자동 조절 

<br>

Button의 경우, 클릭해도 사용되지 않을 버튼이라면 ```User Interaction Enabled``` 체크 해제

<br>

---

<br>

## 키보드 작동시키기

<br>

tapButton(IBAction)메소드 연결해서 만들고, 모든 버튼을 연결한다.

그 후, 버튼의 각 값을 가져와야 하는데 title에 숫자가 적혀있잖음? 그걸 가져오면 된다.

우리가 원하는 건, textfield에 탭한 숫자값이 입력되어야 한다!

**textfield는 ViewController에 있고, 키보드는 CustomKeyboard에 있으므로 중간에 데이터 전달을 ```delegate```로!**

<br>

💡 delegate → 위임  
키보드 값을 눌렀을 때, ViewController에서 값을 받는 기능을 위임

<br>

### CustomKeyboard.swift
CustomKeyboard에서 값을 전달해줘야 하기 때문에 Delegate 프로토콜에서 기능(값 전달) 선언

이제, ViewController에서 이 delegate를 위임받아서 기능을 사용한다! → **값 전달 받기~** 

<br>

### ViewController.swift

그 규격(protocol)에 맞춰서 사용하겠다는 선언이 필요하다

이렇게 프로토콜을 채택하면, Delegate protocol에서 선언한 메소드를 여기에서 기능을 추가! 이 메소드 인자를 통해 값을 넘겨받음 → 이 값을 텍스트필드에 나타냄