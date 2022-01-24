//
//  WebtoonViewModel.swift
//  PageApp
//
//  Created by terry.yes on 2022/01/24.
//

import Foundation
import UIKit

struct WebtoonViewModel {
    private let webtoon: Webtoon
    
    init(_ webtoon: Webtoon) {
        self.webtoon = webtoon
    }
    
    var title: String {
        return self.webtoon.title
    }
    
    var author: String {
        return self.webtoon.author
    }
    
    var image: UIImage? {
        return UIImage(named: self.webtoon.imageFileName)
    }
}

struct WebtoonListViewModel {
    private let list = [
        [ "title" : "모시던 아가씨가 도련님이 되어버렸다", "author" : "시그마,태비의별", "image" : "wait1.png" ],
        [ "title" : "환골탈태", "author" : "마고(mago)", "image" : "wait2.png" ],
        [ "title" : "압도적 그대", "author" : "꿈꾸는이, 웹툰 토연", "image" : "wait3.png" ],
        [ "title" : "용이 비를 내리는 나라", "author" : "썸머", "image" : "wait4.png" ],
        [ "title" : "후궁계약", "author" : "밥꾹,붉은마녀,레죵", "image" : "top1.png" ],
        [ "title" : "그 책에 마음을 주지 마세요", "author" : "문시현,임조조", "image" : "top2.png" ],
        [ "title" : "잉어님과 떡볶이", "author" : "캣낫독,박돈", "image" : "top3.png" ],
        [ "title" : "지독한 릴리", "author" : "헤모,은록", "image" : "top4.png" ],
        [ "title" : "원수는 사장실에서", "author" : "레이먼", "image" : "novel1.png" ],
        [ "title" : "세계 멸망을 굳이 막아야 하나요", "author" : "셀타", "image" : "novel2.png" ],
        [ "title" : "진심으로 정략결혼", "author" : "박죠죠", "image" : "novel3.png" ],
        [ "title" : "여주 죽고 미친 남주의 친구입니다", "author" : "메미칼린", "image" : "novel4.png" ]
    ]
    
    var webtoons: [Webtoon] {
        return list.map {
        //작품의 정보가 없을 때 빈문자열이 맞을까?
            Webtoon(
                title: $0["title"] ?? "",
                author: $0["author"] ?? "",
                imageFileName: $0["image"] ?? ""
            )
        }
    }
    
    var numberOfSection: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.webtoons.count
    }
    
    func webtoonAtIndex(_ index: Int) -> WebtoonViewModel {
        let webtoon = self.webtoons[index]
        return WebtoonViewModel(webtoon)
    }
}
