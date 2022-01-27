//
//  WebtoonTableCell.swift
//  PageApp
//
//  Created by lauren.c on 2022/01/24.
//

import UIKit

class WebtoonCell: UITableViewCell {
    
    var webtoonModel: WebtoonModel?
    
    @IBOutlet var picture: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var purchaseButton: UIButton!
    
    @IBAction func purchaseButtonPushed(_ sender: UIButton) {
        guard let isPurchased = webtoonModel?.isPurchased else {
            return
        }
        if !isPurchased {
            webtoonModel?.isPurchased = true
            NotificationCenter.default.post(name: NSNotification.Name("purchase"), object: self)
        }
    }
    
    func configure(from model: WebtoonModel) {
        webtoonModel = model
        titleLabel.text = model.title
        authorLabel.text = model.author
        picture.image = model.image
        selectionStyle = .none
        purchaseButton.isEnabled = !model.isPurchased
    }
}
