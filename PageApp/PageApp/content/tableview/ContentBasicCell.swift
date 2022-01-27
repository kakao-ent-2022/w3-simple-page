//
//  ContentBasicCell.swift
//  PageApp
//
//  Created by river.o on 2022/01/26.
//

import UIKit

class ContentBasicCell: UITableViewCell {

    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var contentTitle: UILabel!
    @IBOutlet weak var contentAuthor: UILabel!
    
    private let notificationCenter: NotificationCenter = .default
    
    @IBAction func selectPurchaseButtonTounched(_ sender: Any) {
        if let title = contentTitle.text {
            let cart = Cart(title: title)
            notificationCenter.post(name: .onPurchaseContent, object: nil, userInfo: [ContentConstant.cartUserInfoName: cart])
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
