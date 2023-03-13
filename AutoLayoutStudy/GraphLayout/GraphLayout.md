# Graph Layout

<br>

객체는 `multiplier` 값을 가지고 비율을 조절할 수 있다.

→ 코드로 다루기가 조금 어렵다. 

→ 어떻게 하는지 알아보자!

---

Storyboard에서 적용한 constraints 값을 ViewController 코드에 바로 연결할 수 있다! (`@IBOutlet`)

<br>

- constant / priority 프로퍼티를 사용해서 언제든지 값을 설정할 수 있다.

- multiplier는 get-only property라서 값을 설정할 수 없는 형태다.  
    NSLayoutConstraint 라는 값을 새로 만들어서 적용해야 한다.  
    `extension`을 사용해서 진행해보자!

<br>

``` swift
extension NSLayoutConstraint {
    func changeMultiplier(value: CGFloat) -> NSLayoutConstraint {
        //이전 constraints 없애기 -> 없으면 원래 있던 값에 누적된다! -> 원하는 값 나오지 않음
        NSLayoutConstraint.deactivate([self])
        
        //item: first item, toItem: second item
        let newConstraint = NSLayoutConstraint.init(item: self.firstItem, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: value, constant: self.constant)
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        //새로 만든거 넣기
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}
```


- `deactivate`를 사용해서 원래 있던 constraints 설정 값을 비활성화!

- 새로 만든 `newConstraints` 값을 활성화해서 리턴

<br>

이 그래프에 애니메이션 효과도 넣을 수 있는데

```swift
@IBAction func tapStyle2(_ sender: UIButton) {
    graphHeight1 = graphHeight1.changeMultiplier(value: 0.5)
    graphHeight2 = graphHeight2.changeMultiplier(value: 0.6)
    graphHeight3 = graphHeight3.changeMultiplier(value: 0.7)
    graphHeight4 = graphHeight4.changeMultiplier(value: 0.8)
    graphHeight5 = graphHeight5.changeMultiplier(value: 0.9)
    
    UIView.animate(withDuration: 0.5) {
        self.view.layoutIfNeeded()
    }
}
```

- `UIView.animate`를 사용해서 애니메이션 효과를 추가한다.

- `self.view.layoutIfNeeded()` → **화면 갱신 메소드**

    - animate 안에 있으므로 0.5초마다 화면 갱신!