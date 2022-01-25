//
//  WebtoonDataSource.swift
//  PageApp
//
//  Created by lauren.c on 2022/01/24.
//

import UIKit

class WebtoonDataSource: NSObject, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return list.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = WebtoonModel(title: list[indexPath.row]["title"]!, author: list[indexPath.row]["author"]!, imagePath: list[indexPath.row]["image"]!)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath) as! WebtoonCell
        cell.titleLabel.text = item.title
        cell.authorLabel.text = item.author
        cell.picture.image = item.image
        return cell
    }
}



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
[ "title" : "여주 죽고 미친 남주의 친구입니다", "author" : "메미칼린", "image" : "novel4.png" ],
[ "title" : "모시던 아가씨가 도련님이 되어버렸다 되어버렸다", "author" : "시그마,태비의별", "image" : "wait1.png" ]

]
