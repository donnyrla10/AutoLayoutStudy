# Basic

> AutoLayout을 통해 상대적인 값을 설정함으로써 다양한 디바이스의 해상도에 동일한 화면을 표현할 수 있다.  
> 최고의 도구! 최고의 선배! 호우우우 🎉

<br>

# Index


- [Constraint](#contraint)
  - [Add New Contraints](#add-new-constraints)
  - [Add New Alignment Constraints](#add-new-alignment-constraints)
  - [Mutilplier](#about-multiplier)

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

# Safe Area

<br>

> Safe Area는 iPhone X 부터 생긴 개념으로, Safe Area 내만 사용하도록 권장하기 위해 생겼다.  
> 최근 iPhone들은 모두 사용하고 디스플레이가 다르게 나와 Safe Area가 다를 수 있으므로 잘 체크해주자! ✅

<br>

새로운 내용 추가하기