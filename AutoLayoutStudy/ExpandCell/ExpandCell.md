# Expand Cell

<br>

> TableView에서 모든 컨텐츠를 다 보여주는 것이 아니라 눌렀을 때, 전체 내용을 보여주는 방식을 구현해보자

<br>

### Label의 기본 특징

- ```number of rows```: 텍스트의 줄 행을 설정 → 0: 무한

- 텍스트의 크기만큼 Label의 크기가 맞춰진다

<br>

### TableView

- ```AutoLayout constraints``` 값만 제대로 잡아놓으면 자동으로 내부 내용에 따라 cell의 사이즈 조절

- tableView의 cell의 값이 변경되어도 화면이 자동으로 변경되지 않기 때문에 ```reloadData()```를 통해서 TableView의 모든 cell을 reload!

- 만약 한 cell만 reload할거라면 ```reloadRows()```

<br>
<br>

## Expand Cell 구조 잡기

필요한 데이터

- 텍스트
- expand 상태

**Model**

```swift
struct ExpandDataModel {
    var description: String //디테일 내용 텍스트
    var isExpand: Bool      //expand 상태
}
```

→ 이 데이터 타입을 셀 마다 사용할 것이므로 ```Array``` 형태로 가지고 있어야 한다.

<br>

## TableView에 Expand Cell 추가하기  

- UITableViewDataSource

- UITableViewDelegate


<Br>


## AutoLayout 오류


Auto Layout으로 구성된 크기와 설정들이 TableViewCell 변경이 일어났을 때 튀는 경우 종종

→ 변경되지 않는 오브젝트라면 Autolayout으로 깔끔하게 설정 가능

→ 변경되는 오브젝트라면 Autolayout의 설정이 의도와 다르게 수행될 수 있음

<br>

1. ```heightForRowAt()``` 메소드로 정확한 높이 지정   
    수치가 주어진다면, `TableViewDatasource`에서 Cell의 사이즈 설정 가능  
    → 확실히 해결
    
    ```swift
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return dataModels[indexPath.row].isExpand ? 150 : 50
    }
    ```

<br>  

2. `tableView.reloadData()`  
    수치가 고정되지 않고 텍스트의 길이에 따라 달라진다면, 전에 reloadRows로 특정 하나의 cell만 reload를 했었는데, **전체 cell을 reload**하기   
   → 상황에 따라 해결 가능
    
    ```swift
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
        tableView.reloadData()
    }
    ```

<br>

3. `estimatedSectionHeaderHeight/FooterHeight`   
    → 상황에 따라 해결 가능
    
    ```swift
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    		dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
    		tableView.estimatedSectionHeaderHeight = 0
    		tableView.estimatedSectionFooterHeight = 0        
    		tableView.reloadRows(at: [indexPath], with: .none)
    }
    ```

<br>

4. 애니메이션 효과 없애기 `setAnimation(false)`  
   → 확실히 해결

    ```swift
    extension ViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand        
            UIView.setAnimationsEnabled(false) //애니메이션 효과 없애기
            tableView.reloadRows(at: [indexPath], with: .none)
            UIView.setAnimationsEnabled(true) 
            //다시 효과 설정해줘야 함 -> 아니면 모든 상황에서 애니메이션 효과 없음
        }
    }
    ```

    <br>
    <br>
    <br>
    