# Basic

> AutoLayout을 통해 상대적인 값을 설정함으로써 다양한 디바이스의 해상도에 동일한 화면을 표현할 수 있다.  
> 최고의 도구! 최고의 선배! 호우우우 🎉

<br>

# Index

- [AutoLayout](#autolayout)

- [Constraint](#contraint)

  - [Add New Contraints](#add-new-constraints)

  - [Add New Alignment Constraints](#add-new-alignment-constraints)

  - [Mutilplier](#about-multiplier)

- [Priority](#priority)

  - [Content Hugging Priority](#content-hugging-priority)

  - [Content Compression Resistance Priority](#content-compression-resistance-priority)

  - [Constraints Priority](#constraints-priority)

- [Rotation](#rotation)

- [ScrollView](#scrollview)

- [Margin](#margin)

- [StackView](#stackview)

- [Button Inset](#button-inset)

- [Code Anchor](#code-anchor)

<br>
<br>

# AutoLayout

**💡 AutoLayout 에러의 가장 큰 이유**   

- 정확한 위치를 잡을 수 없기 때문

- 정확한 크기를 잡을 수 없기 때문

<br>

```top```, ```bottom```, ```trailing```, ```leading``` 모두 설정했다면 오브젝트의 크기인 ```width```와 ```height``` 값을 도출할 수 있기 때문에 에러 발생 X   

그러나 (top, bottom), (trailing, leading) 쌍 중 하나의 값이라도 설정하지 않으면 width 혹은 height 값을 시스템에서 도출할 수 없기 때문에 에러 발생  

만약 width, height 값을 설정해줬다면 그에 맞는 edge 값을 설정하지 않아도 괜찮음

<br>

즉, top 값만 설정했을 경우 
* height 값 혹은 bottom 값이 있으면 오류 x

* 둘 다 없으면 오류


<br>
<br>

# Constraint  

### Add New Constraints

<img width = '300' alt="add new constraints" src="https://user-images.githubusercontent.com/63290629/218387850-0afdc5d8-1af0-4e9b-b16e-9127e9869c62.png">

<Br>

* **해당 오브젝트와 다른 오브젝트 간의 간격 설정**  
다른 오브젝트가 따로 없을 경우, ```SuperView``` 혹은 ```Safe Area```와의 간격
  
    - ```Leading``` : **왼쪽**을 시작점으로 진행

    - ```Trailing``` : **오른쪽**을 시작점으로 진행

<br>

* **오브젝트의 Width, Height 설정**

  - 절대값

<br>

* **다른 오브젝트와의 Constraints 설정**  
  다른 오브젝트가 있을 경우, 주변 오브젝트 기준으로 간격이 잡힌다.

  - ```Equal Widths```: 오브젝트들의 Width 동일
  
  - ```Equal Heights```: 오브젝트들의 Height 동일


    <img width="276" alt="equals" src="https://user-images.githubusercontent.com/63290629/218393231-7d1cf076-d9b6-4cb7-9828-3ec11e2cde7e.png">  
    
    → 한 오브젝트(주체)에서 다른 오브젝트로 마우스로 연결해서 설정할 수 있음  

    → constants 값을 추가하면 오브젝트(주체)에 그 값만큼 크기 변경

<br>

<img width="285" alt="edit constant" src="https://user-images.githubusercontent.com/63290629/218389308-a6e8c7fc-4e40-4908-ab5c-77d90d7cdd6a.png">

* ```Size Inspector```에서 수정하고 싶은 설정의 **Edit** 버튼 클릭

* constant 값을 수정해서 원하는 값만큼 간격을 둘 수 있다. 

<br>
<br>

## Add New Alignment Constraints

<br>

두 개 이상의 오브젝트를 사용할 때 적용된다. 

* ```Horizontally in Container```, ```Vertically in Container``` 제외
  
* ⬆️ ```SuperView``` or ```Safe Area``` 와의 정렬


<img width="372" alt="alignment" src="https://user-images.githubusercontent.com/63290629/218395667-a49eddc3-147f-48da-8476-a72296233678.png">

* ```Horizontal Centers```: 오브젝트간의 중앙 수평 정렬

* ```Vertical Centers```: 오브젝트간의 중앙 수직 정렬

* ```Horizontally in Container```: SuperView의 수평 중앙 정렬

* ```Vertically in Container```: SuperView의 수직 중앙 정렬


<br>
<br>

## About Multiplier

<br>

multiplier는 **비율**의 개념

* ```Top/Leading```: 시작점 좌표 기준(x, y)으로 곱셈 (⬇️, ➡️ 방향으로 진행)

* ```Bottom/Trailing```: 끝점 좌표 기준으로 시작하기 때문에 나눗셈 (⬆️, ⬅️ 방향으로 진행)

<br>

multiplier는 상세한 값을 편집할 수 있기 때문에 ```Size Inspector```의 **Edit** 버튼을 클릭하면 설정할 수 있다.  

<br>

EX) 2개의 오브젝트의 크기 ```multiplier```

* Equal Height로 설정

* 한 오브젝트의 height를 200(절대값)으로 설정

* ⬆️ 이 오브젝트 Height 설정에서는 multiplier 적용 불가 → 이미 절대값을 설정했기 때문

* ⬆️ 이 오브젝트 Equal Height 값에서 multiplier 값을 2로 설정   
  
  → **이미 크기가 설정되었기 때문**에 상대 오브젝트의 크기가 ```/ 2```

<br>

EX) 오브젝트의 alignment ```multiplier```  

* multiplier를 적절히 사용하면 **정확하고 깔끔한(마음이 편한🤤) 정렬**을 할 수 있다 

* 오브젝트들의 중앙 정렬 후, multiplier를 각각 올바른 위치에 가도록 설정

<br>

**📝 ImageView의 Content Mode**  

* ```Scale To Fill```: 오브젝트의 가로/세로 값과 상관없이 현재 화면 크기에 맞게 설정

* ```Aspect Fit```: 이미지 원본 망가짐 없이, 화면 사이즈 맞추기 (잘림 X)

* ```**Aspect Fill**```: 이미지 원본 망가짐 없이, 화면 사이즈 맞추기 (잘림 O)

<Br>

**📌 화면 꽉 채우기 (Safe Area 무시-)**

* ```SuperView```로 상위 상대뷰를 변경 (Safe Area에서) ✅

* Safe Area 없애기 (```User Safe Area Layout Guide```) ❌  
  
  → 권장하지 않음 

<br>

**📌 multiplier를 언제 사용하면 좋을까?**

어떤 오브젝트를 화면에 붙이고 싶은데, 다른 디바이스에서도 똑같은 화면이 나오면 좋겠다.  

x, y 값을 지정해주면 되지 않을까? OR 중앙 정렬 후, constant 값을 지정해주면 되지 않을까?  → ❌  

➡️ 절대값이 들어가면 다른 디바이스에서(특히 작거나 큰 화면)는 원하는 모습이 나타나지 않을 수 있음

➡️ 상대값으로 설정해주기 ✅ **Multiplier**


<br>  
<br>

# Priority

<br>

AutoLayout에서 priority란, 

```constraints``` 의 우선순위를 설정해서 어떤 상황에 대해 우선순위를 따라 적용되는 것

→ 이로 인해, 다른 오브젝트가 우선순위에 밀려 줄어들거나 밀릴 수 있다.

<br>

## Content Hugging Priority

<br>

* 오브젝트의 컨텐츠를 그대로 유지할 수 있는 우선순위

* 범위: 1 ~ 1000 (1000: 어떤 경우에 대해서도 변함없음)

* 상대 오브젝트와 동일한 priority를 가지고 있다면, 둘다 컨텐츠의 크기 유지

* Hugging Priority가 더 크다면 다른 오브젝트와 만나더라도 크기 유지. (다른 오브젝트의 크기가 변함)

* Hugging Priority가 더 작다면 다른 오브젝트의 크기에 맞춰 크기 변화. (다른 오브젝트의 크기는 유지)


## Content Compression Resistance Priority

<br>

* 오브젝트의 크기를 유지하고, 늘려지거나 줄어드는 것을 방지하는 우선순위

* 현재 오브젝트보다 큰 오브젝트에 의해 눌리는 상황에 사용

<br>

> ⭐️ hugging은 절대적인 크기, compression resistance는 상대적인 크기라고 생각한다.  
> Hugging은 현재 오브젝트의 절대적인 크기를 유지하도록 하는 우선순위  
> Compression resistance는 현재 오브젝트의 크기를 다른 오브젝트의 크기에 반응해서 어떻게 할 것인지(줄어들거나 늘어나게 둘 것인지 그대로 유지할 것인지)를 선택하는 우선순위

<br>

## Constraints Priority]

<br>

constraints에 priority 프로퍼티 값을 설정할 수 있다.

예시)  
leading의 priority가 1000 이라는 것은 priority가 가장 높으니까 맨 처음 이 constraint 값을 적용.
만약 leading priority를 200으로 설정하면, 

<br>

<img width="550" alt="priority" src="https://user-images.githubusercontent.com/63290629/218636717-5e087c50-8141-4500-aa9a-961f36d34090.png">

<br>

* 점선과 함께 간격이 멀어지는데 priority가 낮아서 적용 순서가 밀린 것

* 우측 Hugging priority 252, Compression Resistance Priority 750

* 좌측 Hugging priority 251, Compression Resistance Priority 750

* 다른 constraint 적용 → compression resistance priority → Hugging priority → leading priority 순


<br>
<br>


# Rotation

<br>

디바이스의 가로모드(```Landscape```), 세로모드(```Portrait```)에 따른 UI 구성

AutoLayout을 사용하면 가로모드로 바꿔도 그에 맞게 구성이 된다.

Rotation은 **가로모드와 세로모드의 UI 구성을 다르게 하고 싶을 때 사용**한다.

[ Vary for Traits ] Xcode13부터 없어짐

⬇️

```
Xcode > Setting > General > File Extension > Show All
```

<img width="942" alt="setting" src="https://user-images.githubusercontent.com/63290629/218636723-386a4e67-a95f-4ef1-895e-bf935dec362e.png">

<br>

📌 [Apple HIG > Layout](https://developer.apple.com/design/human-interface-guidelines/foundations/layout)

<br>

<img width="1442" alt="HIG_Layout" src="https://user-images.githubusercontent.com/63290629/218636728-beff64dd-c582-41b0-87b8-ac928c94a62b.png">


<br>

제작하고 있는 앱이 지원하는 디바이스에 맞춰서 진행 

iPhone의 

- 세로모드: any width, `regular height`

- 가로모드: any width, `compact height`


모든 경우에 있어서 하나씩 하면 실수할수도 있고, 너무 오래 걸린다. 

→ Constraints를 모두 선택해서 한번에 바꾸기

ex) 세로모드 기준, 가로모드는 새로운 layout을 만들어서 설정하겠다라는 가정

```size inspector```에서

<br> 

<img width="1552" alt="portrait" src="https://user-images.githubusercontent.com/63290629/218636731-61c4dfb6-a256-48c6-a911-6723af064304.png">

<br>

* 기존의 Installed 체크 해제

* hR Installed 체크 → 세로모드에서만 가능한 설정

* 가로모드로 변경 시 → constraints들이 비활성화

<br> 

<img width="1552" alt="landscape1" src="https://user-images.githubusercontent.com/63290629/218636733-7aa3fd50-49ff-4ca1-b4f3-c12aa31ab515.png">

<br>

* 가로모드에선 비활성화 된 Constraints에 상관없이 가로모드에 내가 원하는 UI 구성으로 바꿔주면 된다.

* 가로모드 설정 추가 (wC Installed)

<br>

<img width="1552" alt="landscape2" src="https://user-images.githubusercontent.com/63290629/218636737-af880e5d-58c2-474c-b42c-76e9c5625a6a.png">

<br>

> - Installed : 모든 경우에서의 설정
> - hR Installed : 세로 모드의 경우에서의 설정
> - wC Installed : 가로 모드의 경우에서의 설정

<br>
<br>

# ScrollView

<br>

```
ScrollView > Size Inspector > Content Layout  Guides 체크 해제
```

<br>

* ScrollView는 안에 있는 컨텐츠에 대한 constraints 값이 설정되어 있어야 함

* 컨텐츠의 width, height만 정확하다면,스크롤할거니까 bottom의 값은 정확하지 않아도 됨 

* 컨텐츠의 width, height 값을 없애고 화면에 꽉 채우도록 하면, 디스플레이 화면을 넘어서지만 스크롤링해서 이동 가능

<br>


여러 오브젝트를 ScrollView 안에 넣을 경우

* 오브젝트들을 하나의 ```View```로 감싸고 그 view를 ```ScrollView```로 감싸는게 깔끔

* ```Embed In View > View```

* ScrollView를 화면에 꽉차게 → constraints edges = 0

* TextField의 값에 따라서 사이즈가 결정되도록. TextFields의 constraints edges = 20

* TextField 오브젝트를 감싼 View의 constraints edges = 0

* TextField 오브젝트를 감싼 View를 SuperView로 우클릭 드래그해서 Equal Width → **화면 width에 맞춰서 textfield 사이즈 변경**

<br>

**⭐️ system에서 자동 설정해주는 것과 내가 원하는 설정이 다를 수 있다.**  

* 문제: Textfield를 감싼 View를 SuperView에 Equal width로 설정해서 SuperView의 width에 TextField가 맞도록 했지만 변화가 없음

* 해결: Equal Width constraint의 size inspector에 들어가니 multiplier가 0.92 로 설정되어 있었다. 이를 1로 바꿔주니 원하던 대로 결과가 나왔다.

* 배운 것: ***시스템이 자동으로 설정해준 것도 다시 보자!***


<br>
<br>

# Margin

<br>

> **AutoLayout의 Constrain to margins란?**
내 View의 Sub View들을 배치할 때 margin을 주는 것
즉, `오브젝트 내부`에 margin 값을 주는 것
> 

<br>

- View에 edges들을 0으로 설정하고, size inspector에서 `Layout Margins`에 Fixed > margin 값을 넣는다 (default: 8)

- Sub View에 Add New Constraints를 할 때 Constrain to margins에 체크하면, View의 내부 margin만큼 Sub View에 margin이 들어간다

<br>

💡 margin은 언제 사용하면 좋을까?

한 view 안에 여러 sub view를 동일하게 view와 간격을 주고 싶다면, view에 margin을 한번만 줘도 모든 sub view에 margin이 적용되어 동일한 간격이 된다. (이렇게 안하면 각각 오브젝트에 따로 설정해줘야 한다)

<br>
<br>

# StackView

- 오브젝트 나열-정렬  
- 여러 오브젝트를 정렬/배치해야할 때, 복잡한 constraints를 단순화

<br> 

**Attributes Inspector** 

<img width="251" alt="stackview" src="https://user-images.githubusercontent.com/63290629/219273758-29cbff0e-e168-4368-b085-fac87eb6c934.png">

<br>

- ```Axis```: 정렬 축

    - Horizontal

    - Vertical

- ```Alignment```: 정렬 기준

    - Horizontal

        - Fill

        - Top

        - Bottom

        - Leading

        - Trailing

        - First Baseline

        - Last Baseline
        
    - Vertical

        - Fill

        - Leading

        - Center

        - Trailing

- ```Distribution```: Stack 안에 있는 오브젝트들간의 분배

    - Fill: 오브젝트가 가지고 있는 사이즈에 맞춰서 채우기

    - Fill Equally: 모든 오브젝트 사이즈를 동일하게 채우기

    - Fill Proportionally: 오브젝트의 크기를 조정해서 사용 가능한 공간을 채우기.      
    고유한 오브젝트 크기에 따라 비례적으로 크기가 조정

    - Equal Spacing: 오브젝트 사이즈는 원본 그대로 둔 채로, 오브젝트 간의 간격을 동일하게   
    (아래 spacing 값 x, spacing 값은 최솟값)

    - Equal Centering: 오브젝트의 center를 기준으로 동일한 간격

- ```Spacing```: 오브젝트 간의 간격

    - Fill, Fill Equally는 spacing 값 그대로 유지
  

<br>
<br>

# Button Inset

Button의 경우, 텍스트의 크기만큼 오브젝트의 크기가 설정된다.

- 길이가 길어지면, width 증가

- 폰트 사이즈가 커지면, width/height 증가 (height는 위아래로 간격이 있음)
    
    → 버튼을 탭할 영역이 필요하므로, 추가된 것
    
<br>

**Button Inset**  

버튼의 내부 여백 설정


💡 Inset 값 설정 후, ```command``` + ```=``` 을 누르면 ```Size to Fit Content```으로 컨텐츠 사이즈에 맞게 설정
Constraints가 설정되어있으면 자동으로 변경

<br>

**Button 사이즈**   

Content Insets + Image Size(option) + Text Size(option)

<br>

**Button을 조절하고 싶다면 그전에 설정할 것**  

```
Button > Style > Default
```

<br>

<img width="261" alt="ButtonInset" src="https://user-images.githubusercontent.com/63290629/219273750-379703ed-74d4-40dc-828b-795cdb7e1546.png">

<br>

- ```Content Insets```: 버튼 내부 컨텐츠와 버튼 크기 사이의 여백 값 설정

- ```Title Insets```: Text의 여백 값 설정

- ```Image Insets```: Image의 여백 값 설정

    Title/Image Insets는 Image 와 Text 를 함께 버튼에 넣은 경우

<br>

**Button에 Image 넣기**

- ```Image```: 텍스트 형태로 image

- ```Background```: 버튼의 배경으로 image

<br>

기본적으로 Image - Text 형태로 구성되는데, 반대로도 가능하다

```
Attributes Inspector > View > Semantic > Force Right-to-Left
```

<br>

💡 constraints를 설정했던 위치에서 잘못 옮겼다면 

```option``` + ```command``` + ```=``` (Update Frames)

<br>

**🚨 주의**

- **문제**: Title Insets의 값을 줬을 때, Button의 크기가 늘어나지 않아서 text만 밀리는 상황  
   → Title Insets과 Image Insets은 Button 사이즈에 영향 미치지 않음

- **해결**: content insets도 함께 값을 변경해주기


<br>
<br>

# Code Anchor


코드로 만들어진 오브젝트는 ```constraints``` 설정이나 크기에 대한 개념이 없으면 보이지 않음


```swift
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //버튼 객체 생성 (system type : system에서 기본적으로 설정해주는
        let button = UIButton.init(type: .system)
        //버튼 타이틀 설정
        button.setTitle("button", for: .normal)
        //View위에 오브젝트 추가 (storyboard에 올려놓는 것처럼)
        self.view.addSubview(button)
        
        //AutoLayout 설정을 하겠다는 의미 -> 필수
        button.translatesAutoresizingMaskIntoConstraints = false
        //configure constraints
        //기본적으로 비활성화 -> isActive 파라미터 추가
        //가운데 정렬 -> Horizontally in Container, Vertically in Container
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        //constant 값을 주길 원한다면 아래 코드처럼
        //button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 100).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        let label = UILabel.init()
        label.text = "lable"
        
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        //equalTo : 연결할 대상이 될 view -> safe area 기준
        label.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        label.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
    }
}
```
<br>

- `self.view.addSubview(오브젝트)`
    
    view에 오브젝트 추가 (storyboard에 올려놓는 것처럼)
    
- `오브젝트.translatesAutoresizingMaskIntoConstraints = false`
    
    AutoLayout 설정을 하겠다는 의미
    
- `오브젝트.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true`
  
    가운데 수평 정렬

- `오브젝트.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true`  

    safe area 기준으로 constraint 설정
