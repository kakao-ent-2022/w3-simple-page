# w3-simple-page
3주차 심플한 페이지 앱

## 1. dataSource와 controller 연결하기

<image src="https://images.velog.io/images/lauren-c/post/258eb974-e698-4194-913e-ffd5917761bc/image.png" width=35%>

- tableViewController는 nib file 또는 storyboard로부터 table view를 자동으로 load하기 때문에 `tableView` 프로퍼티를 통해 바로 접근 가능하다.
- tableViewController는 data source와 delegate를 자동으로 self로 지정하기 때문에 override를 해줘야한다.
- viewDidLoad에서만 dataSource 클래스를 이용하면 메서드가 끝나자마자 reference를 제거하기 때문에 클래스 맴버 변수로 dataSource를 선언하여 reference를 유지해줘야 한다.

## 2. custom table view cell 이용하기
- iPhone12
<image src="https://images.velog.io/images/lauren-c/post/0b3c9eb6-e104-4e5a-b070-71f596260f57/image.png" width=35%>
- iPhone SE2
<image src="https://images.velog.io/images/lauren-c/post/a1f93487-bf98-485f-ba1c-77ea0ded1414/image.png" width=35%>

- iPhone 8+
<image src="https://images.velog.io/images/lauren-c/post/a2735942-3c4b-43c2-85c1-50eb5d60bf72/image.png" width=35%>
