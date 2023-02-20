# StackView

화면 구성할 때, 요소들을 각각 따로 생각하지 말고 **공통의 요소로, 그룹으로 나눠서** 생각하기 
(각각을 따로 구성하면 수정 혹은 구성할 때 혼돈스럽다)

<br>

### StackView의 특성

- 한쪽 방향으로만 정렬 (Vertical/Horizontal)

<br>

### Calculator 실습

<br>

- Calculator UI를 ```AutoLayout```으로 구현해보기

- Button을 코드로 동그랗게 만들기 (```cornerRadius```)

<br>

<p align= center>
    <img src=https://user-images.githubusercontent.com/63290629/219915098-4f26477a-d0d8-4be3-9f54-8c517348e9e1.png width="40%"/> 
    &nbsp;&nbsp;&nbsp;&nbsp; 
    <img src=https://user-images.githubusercontent.com/63290629/219993381-e57c0df9-b4e7-47d4-aa50-7e3b95e94660.png width="40%"/>
</p>


### Button을 동그랗게

<br>

- cornerRadius를 사용하기

- 오브젝트가 정확히 정사각형이어야 함

- *```clipsToBounds``` vs ```masksToBounds```*
    
    두 프로퍼티 모두 자신의 영역 이외의 영역을 그릴지 말지를 결정
    
    `clipsToBounds`
    
    subview가 내 view를 넘어선 경우, view 너머로 그릴 것인지 말 것인지
    
    소속: UIView
    
    - true라면, view 영역 바깥의 subview는 그려지지 않음
    
    - false라면, view 영역 바깥에서도 그려짐
    
    `masksToBounds`
    
    sublayer가 내 layer를 넘어선 경우, layer 너머로 그릴 것인지 말 것인지
    
    소속: CALayer
    
    - true라면, layer 영역 바깥의 sublayer는 그려지지 않음
    
    - false라면, layer 영역 바깥에서도 그려짐

<br>

```swift
btn.layer.cornerRadius = btn.bounds.width / 2
```

💡 이 설정은 ```viewDidLoad()```가 아닌 ```viewDidAppear()```에서 실행하기!   
```viewDidLoad()```가 실행되는 시점에서는 화면이 그려지기 전이다. 그런데 우리는 버튼의 크기를 지정해준게 아니라 stack view를 통해 계산하도록 했기 때문에 화면이 나오기 전까지는 크기나 위치에 대한 값이 정확히 나오지 않는다. 그러므로 이 설정은 ```viewDidLoad()```가 아니라 ```viewDidAppear()```에서 해줘야 한다. 
<br>

```viewDidLoad()```    
→ view가 모두 추가가 되었을 때, 호출되는 함수. 즉, 화면이 다 그려지고 실행되는 함수

<br>

### 체크하기
<br>

오브젝트를 디바이스의 사이즈에 따라 변경되도록 하려면? **최소 높이를 정해주자!**

- ≥ 100 → 최소 height 100 

- ≤ 100 → 최대 height 100

- 디바이스에 따라 **가장 작은 값 ~ 가장 큰 값**을 설정할 수 있다.

- 디바이스에 따라 **가변적**이라면, ```priority``` 값을 바꿔주기 (**우선순위 낮추기**)

<br>

⬇️ 우선순위 조정 후
<img width="320" alt="calculator" src="https://user-images.githubusercontent.com/63290629/219993381-e57c0df9-b4e7-47d4-aa50-7e3b95e94660.png">

<br>

### Conclusion

<br>

- 모든 ```constraint```를 생각하면서 진행해야 하니 너무 복잡하고 어려웠다.  
    익숙해질 수 있도록 연습을 많이 해야겠다.

- 혹시 **원했던 값이 안나온다면 꼭 constraint 상세 값에 들어가보자.**  
  multiplier 값이 1이 아닐수도!

- Stack View의 Attribute 공부를 더 해보자. 

  - ```Distribution```이 헷갈린다
