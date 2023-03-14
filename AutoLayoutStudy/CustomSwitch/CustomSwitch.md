# Custom Switch

<br>

> 스위치 모양을 커스텀해보자

<br>

UIKit에서 제공하는 UISwitch는 크기조절이 안되는 제약이 있다. 다른 크기의 스위치를 만들어보자!

<br>

<img width="300" alt="Screenshot 2023-03-14 at 10 32 08 AM" src="https://user-images.githubusercontent.com/63290629/224869495-376927d0-5e84-4832-82f7-18aaa65639f4.png">


<br>

**사용한 객체**

- `UIView` → 스위치 배경
    
    width: 200, height: 50, Vertical / Horizontal in Container
    
- `UIButton` → 스위치 동그란 버튼
    
    width / height: 50, Vertical / Horizontal in Container
    

이 버튼에 Align Center X의 constant 값을 변경하면 이동하는 것을 알 수 있다.

가장 끝으로 가려면 `UIView.width - UIButton.width/2`

<br>

> 🎨 색상표를 보고 싶다면?  
> `#colorLiteral(`
