//
//  WebtoonTableViewCell.swift
//  PageApp
//
//  Created by terry.yes on 2022/01/24.
//

import UIKit

extension NSNotification.Name {
    static let didWebtoonPurchase = Notification.Name("didWebtoonPurchase")
}

class WebtoonTableViewCell: UITableViewCell {

    var webtoonViewModel: WebtoonViewModel?
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(webtoonViewModel: WebtoonViewModel) {
        self.webtoonViewModel = webtoonViewModel
        titleLabel.text = webtoonViewModel.title
        authorLabel.text = webtoonViewModel.author
        thumbnail.image = webtoonViewModel.image
    }

    @IBAction func purchaseButtonTouched(_ sender: Any) {
        let userInfo = ["webtoon": self.webtoonViewModel]
        NotificationCenter.default.post(name: .didWebtoonPurchase, object: self, userInfo: userInfo)
    }
}
