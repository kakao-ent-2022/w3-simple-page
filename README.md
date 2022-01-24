# w3-simple-page
3주차 심플한 페이지 앱

## 1. dataSource와 controller 연결하기

<image src="https://images.velog.io/images/lauren-c/post/258eb974-e698-4194-913e-ffd5917761bc/image.png" width=35%>

- tableViewController는 nib file 또는 storyboard로부터 table view를 자동으로 load하기 때문에 `tableView` 프로퍼티를 통해 바로 접근 가능하다.
- tableViewController는 data source와 delegate를 자동으로 self로 지정하기 때문에 override를 해줘야한다.
- viewDidLoad에서만 dataSource 클래스를 이용하면 메서드가 끝나자마자 reference를 제거하기 때문에 클래스 맴버 변수로 dataSource를 선언하여 reference를 유지해줘야 한다.
