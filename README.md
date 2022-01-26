# w3-simple-page
3주차 심플한 페이지 앱

## 1. 테이블 뷰 생성

- 2022. 01. 24 11:55
- 테이블 뷰를 완성하였습니다.
- 테이블 뷰에 관련된 데이터들을 ViewModel를 활용하여 넣어주었습니다.
<img src="https://images.velog.io/images/taelee/post/2c409a7e-460c-4203-8cb6-234124ee1873/image.png" width=400>


## 2. 구매버튼 클릭 시 구매기록이 저장되도록 구현
- 2022. 01. 24 17:20
- 테이블 뷰를 네비게이션 컨트롤러에 embeded시켰습니다.
- 상단 뷰에 오토레이아웃을 적용하였습니다.
- 테이블뷰에 커스텀셀을 활용하여 이미지와 레이블이 표시되도록 하였습니다.
- 구매버튼 클릭시 노티피케이션 센터에 데이터가 post되고 PuchaseListViewModel이 이 데이터를 받도록 하였습니다.

![](https://images.velog.io/images/taelee/post/7b13ab44-dc0a-4eaa-904c-bc5f37c37675/Jan-24-2022%2017-17-00.gif)

## 3. 구매기록 관리화면 구현
- 2022.01.25 17:50
- 구매한 웹툰은 더 이상 구매하지 못하도록 구현하였습니다.
- 구매기록화면에서 삭제하면 다시 구매버튼이 활성화됩니다.

![](https://images.velog.io/images/taelee/post/224aa9a7-17f8-41aa-9f81-3dc34126ab3a/Jan-25-2022%2012-33-30.gif)

## 4. 앱이 백그라운드로 갈 때 구매기록을 UserDefaults에 저장
- 2022.01.26 11:46
- UIApplication.willResignActiveNotification과 UIApplication.didBecomeActiveNotification의 Notification을 받을 수 있게 observer를 달았습니다.
- 각 노티가 발생할 때 PurchaseListViewModel이 UserDefaults에 저장할 수 있도록 하였습니다!
![](https://images.velog.io/images/taelee/post/7b9a5207-38aa-4ba2-9e4c-e136618249c5/Jan-26-2022%2011-39-24.gif)
