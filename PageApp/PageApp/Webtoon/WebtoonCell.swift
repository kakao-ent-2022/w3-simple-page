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
        NotificationCenter.default.post(name: NSNotification.Name("purchase"), object: webtoonModel)
    }
}
