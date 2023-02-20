# Dynamic Font

> Text라는 개념은 위치나 크기조절이 가변적, 비율적으로 변경 가능  
> 어떻게 유용하게 사용할 수 있는지 알아보자.

<Br>

## Overview

<br>

이미지의 원본 비율 그대로 유지하고 싶다면, aspect ratio를 사용하자!  
ex) 이미지의 사이즈가 1009x1438라면, aspect ratio의 multiplier도 1009:1438

<br>

## 여러 오브젝트 정렬하기

<br>

이미지 위에 label 추가하면 현재 디바이스에선 제대로 위치하는 것처럼 보이지만, 다른 디바이스에서 보면 올바른 곳에 위치하지 않을 수가 있다. 

**왜?**

정렬은 해당하는 오브젝트의 RootView(superview)의 크기의 비율을 따라간다.   
즉, 디바이스 기준으로 정렬

그러므로, 여러 오브젝트를 위에 올리면서 오브젝트를 비율적으로 구성하기 위해서는 ```View```에 넣어서 그룹으로 만들어서 정렬 진행하기!

→ SuperView가 아니라 **오브젝트들의 Super View인 View가 Root View!**  

<br>

이전에는 오브젝트에 constraints와 사이즈를 변경했었는데, 이젠 이들을 감싼 view에 적용해야 한다.

- 정렬할 오브젝트 두개(image, label) 모두 선택

- Alignment → Top / Bottom 선택, Horizontal Center 정렬

- Bottom multiplier 0.35 → 윗 부분 35%, 아랫 부분 65%


> 💡 Top/Leading은 0에서 시작할 수 있기 때문에, Bottom/Trailing에서 multiplier 값을 넣어주기!

<br>

## Text의 사이즈는 어떻게 줄일 수 있을까??

<br>

폰트 사이즈 가변되는 형태는 ```Attribute Inspector```에서 적용하고 있다.

- Autoshrink
  
    - Minimum Font Size

    - Minimum Font Scale

<br>

현재 가장 큰 디바이스 기준으로 폰트 사이즈를 설정하고, Autoshrink에서 ```Minimum Font Size``` 설정해주기

> 아이패드도 포함할 경우 기준은 가장 큰 아이패드 디바이스

<br>

텍스트를 쓸 수 있는 공간이 줄어들 때, 폰트 사이즈가 줄어든다. autoshrink에서 설정한 값보다 더 컨텐츠 크기가 작아진다면, 축약(…)된다.

→ ***font size는 가장 큰 디바이스 기준으로, autoshrink의 minimum font size는 가장 작은 디바이스 기준으로***

<br>

Label의 비율은 뒤의 Image에 따라가야 하므로 Equal Widths 설정, multiplier로 비율 조절  
-> 가장 작은 디바이스에서 보면, 비율에 맞춰서 알맞은 폰트 사이즈가 들어간다!!  

텍스트의 시작점이 같을 경우  
-> 다른 오브젝트와 함께 선택해서, Leading Edges를 설정해주면 된다.


<br>
<br>
<br>