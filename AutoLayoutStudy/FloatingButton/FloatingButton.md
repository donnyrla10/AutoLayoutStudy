# Floating Button

<br>

<p align= center>
    <img src=https://user-images.githubusercontent.com/63290629/221176763-cab19ce2-9186-4773-90bb-f18bb2f88cdb.jpg width="40%"/>
    &nbsp;&nbsp;&nbsp;&nbsp; 
    <img src=https://user-images.githubusercontent.com/63290629/221176771-b6a94075-4122-4c53-b8e1-449e5d76ce9c.jpg width="39.5%"/> 
</p>

<br>

당근 마켓에서 볼 수 있는 floating Button 만들어보기!  


> 버튼을 눌렀을 때, 다른 버튼들이 위로 올라오면서 나오는 그런 구성을 할 것


→ 추가된 화면에서 만들면 깔끔하게 할 수 있다! (view controller)s

→ 이 controller를 화면 위에 올릴 것!

- 버튼들이 add button을 기준으로 y축으로 올라갔다가 내려오는 애니메이션 구성

<br>

---


<br>


- Add button을 누르면 새로운 View Controller로 화면 전환

- 새로 나온 View Controller 뒷 배경에 블러 처리 → `Visual Effect View with Blur` 객체

- Add button을 클릭하면 3개의 버튼이 위로 올라오게 하기!

    Add button과 centerY의 값으로 거리를 멀게 할 수 있다.

    → outlet 변수로 constant 값 변경하기

  - 처음에는 모두 Add button과 동일한 값으로 `viewDidLoad`
  
  - 화면이 다 그려지고 난 후에 `viewDidAppear`에서 animation 구현

- Add button을 클릭하면 view controller 내리기

    - button들의 constant 값 변경

    - animation 구현

<Br>

<p align= center>
    <img src=https://user-images.githubusercontent.com/63290629/221176749-62e53dc0-cf70-464c-8e97-8a178df4a3c0.png width="40%"/>
    &nbsp;&nbsp;&nbsp;&nbsp; 
    <img src=https://user-images.githubusercontent.com/63290629/221176740-69296b26-da8c-4ad1-b973-9759d55b6331.png width="40%"/> 
</p>

